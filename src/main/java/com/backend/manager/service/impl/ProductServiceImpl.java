package com.backend.manager.service.impl;

import com.backend.manager.common.MyException;
import com.backend.manager.dao.ProductMapper;
import com.backend.manager.dao.UserMapper;
import com.backend.manager.dto.ProductSearchDTO;
import com.backend.manager.pojo.Product;
import com.backend.manager.pojo.User;
import com.backend.manager.response.PageDataResult;
import com.backend.manager.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.*;

/**
 * @Title: AdminUserServiceImpl
 * @Description:
 * @author: youqing
 * @version: 1.0
 * @date: 2018/11/21 11:04
 */
@Service
public class ProductServiceImpl implements ProductService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageDataResult getProductList(ProductSearchDTO userSearch, Integer pageNum, Integer pageSize) {
        PageDataResult pageDataResult = new PageDataResult();
        List<Product> baseAdminUsers = productMapper.selectListByProduct(userSearch);

        PageHelper.startPage(pageNum, pageSize);

        if(baseAdminUsers.size() != 0){
            PageInfo<Product> pageInfo = new PageInfo<>(baseAdminUsers);
            pageDataResult.setList(baseAdminUsers);
            pageDataResult.setTotals((int) pageInfo.getTotal());
        }

        return pageDataResult;
    }

    @Override
    public List<Product> getProductExportList(ProductSearchDTO product) {
        return productMapper.selectListByProduct(product);
    }

    @Override
    public Map<String,Object> addProduct(Product product) {
        Map<String,Object> data = new HashMap();
        try {
            int result = productMapper.insertSelective(product);
            if(result == 0){
                data.put("code",0);
                data.put("msg","新增失败！");
                logger.error("产品[新增]，结果=新增失败！");
                return data;
            }
            data.put("code",1);
            data.put("msg","新增成功！");
            logger.info("产品[新增]，结果=新增成功！");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("产品[新增]异常！", e);
            return data;
        }
        return data;
    }


    @Transactional(readOnly = false,rollbackFor = Exception.class)
    @Override
    public boolean batchImport(String fileName, MultipartFile file) throws Exception {

        boolean notNull = false;
        List<User> userList = new ArrayList<User>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            throw new MyException("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        InputStream is = file.getInputStream();
        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        if(sheet!=null){
            notNull = true;
        }
        User user;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null){
                continue;
            }

            user = new User();

            if( row.getCell(0).getCellType() !=1){
                throw new MyException("导入失败(第"+(r+1)+"行,姓名请设为文本格式)");
            }
            String name = row.getCell(0).getStringCellValue();

            if(name == null || name.isEmpty()){
                throw new MyException("导入失败(第"+(r+1)+"行,姓名未填写)");
            }

            row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
            String phone = row.getCell(1).getStringCellValue();
            if(phone==null || phone.isEmpty()){
                throw new MyException("导入失败(第"+(r+1)+"行,电话未填写)");
            }
            String add = row.getCell(2).getStringCellValue();
            if(add==null){
                throw new MyException("导入失败(第"+(r+1)+"行,不存在此单位或单位未填写)");
            }

            Date date;
            if(row.getCell(3).getCellType() !=0){
                throw new MyException("导入失败(第"+(r+1)+"行,入职日期格式不正确或未填写)");
            }else{
                date = row.getCell(3).getDateCellValue();
            }

            String des = row.getCell(4).getStringCellValue();

            user.setName(name);
            user.setPhone(phone);
            user.setAddress(add);
            user.setEnrolDate(date);
            user.setDes(des);

            userList.add(user);
        }
        for (User userResord : userList) {
            String name = userResord.getName();
            int cnt = userMapper.selectByName(name);
            if (cnt == 0) {
                userMapper.insertSelective(userResord);
                System.out.println(" 插入 "+userResord);
            } else {
                userMapper.updateUserByName(userResord);
                System.out.println(" 更新 "+userResord);
            }
        }
        return notNull;
    }

    @Override
    public boolean batchImportProduct(String fileName, MultipartFile file) throws Exception {
        boolean notNull = false;
        List<Product> productList = new ArrayList<Product>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            throw new MyException("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        InputStream is = file.getInputStream();
        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        if(sheet!=null){
            notNull = true;
        }
        Product product;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null){
                continue;
            }
            product= new Product();

            Long id =Long.parseLong(row.getCell(0).getStringCellValue()) ;


            String name = row.getCell(1).getStringCellValue();

            row.getCell(2).setCellType(Cell.CELL_TYPE_NUMERIC);
            BigDecimal price = BigDecimal.valueOf(row.getCell(2).getNumericCellValue());

            Date createDate = DateUtils.parseDate(row.getCell(3).getStringCellValue(),"yyyy-MM-dd");
            product.setId(id);
            product.setName(name);
            product.setPrice(price);
            product.setcreateDate(createDate);

            productList.add(product);
        }
        for (Product obj : productList) {
            Long id = obj.getId();
            Product subProduct = productMapper.selectByPrimaryKey(id);
            if (Objects.isNull(subProduct)) {
                productMapper.insertSelective(obj);
                System.out.println(" 插入 "+obj);
            } else {
                productMapper.updateByPrimaryKeySelective(obj);
                System.out.println(" 更新 "+obj);
            }
        }
        return notNull;
    }


}
