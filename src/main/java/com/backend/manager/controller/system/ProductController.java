package com.backend.manager.controller.system;

import com.backend.manager.common.utils.DateUtils;
import com.backend.manager.common.utils.ExcelData;
import com.backend.manager.common.utils.ExportExcelUtils;
import com.backend.manager.dto.ProductSearchDTO;
import com.backend.manager.pojo.BaseAdminUser;
import com.backend.manager.pojo.Product;
import com.backend.manager.response.PageDataResult;
import com.backend.manager.service.AdminUserService;
import com.backend.manager.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: ProductController
 * @Description: 商品管理
 * @author: jack
 * @version: 1.0
 * @date: 2020/10/20
 */
@Controller
@RequestMapping("product")
public class ProductController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private ProductService productService;


    /**
     *
     * 功能描述: 跳到系统用户列表
     *
     * @param:
     * @return:
     * @auther: youqing
     * @date: 2018/11/21 13:50
     */
    @RequestMapping("/productManage")
    public String userManage() {
        return "/product/productManage";
    }


    /**
     *
     * 功能描述: 分页查询用户列表
     *
     * @param:
     * @return:
     * @auther: youqing
     * @date: 2018/11/21 11:10
     */
    @RequestMapping(value = "/getProductList", method = RequestMethod.POST)
    @ResponseBody
    public PageDataResult getUserList(@RequestParam("pageNum") Integer pageNum,
                                      @RequestParam("pageSize") Integer pageSize,/*@Valid PageRequest page,*/ ProductSearchDTO product) {
        /*logger.info("分页查询用户列表！搜索条件：userSearch：" + userSearch + ",pageNum:" + page.getPageNum()
                + ",每页记录数量pageSize:" + page.getPageSize());*/
        PageDataResult pdr = new PageDataResult();
        try {
            if(null == pageNum) {
                pageNum = 1;
            }
            if(null == pageSize) {
                pageSize = 10;
            }
            // 获取用户列表
            pdr = productService.getProductList(product, pageNum ,pageSize);
            logger.info("用户列表查询=pdr:" + pdr);

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("用户列表查询异常！", e);
        }
        return pdr;
    }

    @GetMapping("/productExport")
    public void productExport(ProductSearchDTO parameter,
                              HttpServletResponse response) throws Exception {
        ExcelData data = new ExcelData();
        data.setName("productExport");
        List<String> titles = new ArrayList();
        Product product = new Product();
        Class cls = product.getClass();
        Field[] fields = cls.getDeclaredFields();
        for(int i=0; i<fields.length; i++){
            Field f = fields[i];
            f.setAccessible(true);
            titles.add(f.getName());
        }

        data.setTitles(titles);

        //填充内容
        List<Product> productList = productService.getProductExportList(parameter);
        List<List<Object>> rows = new ArrayList();
        List<Object> row = new ArrayList();
        for(Product obj :productList){
            row.add(obj.getId());
            row.add(obj.getName());
            row.add(obj.getPrice());
            row.add(DateUtils.getFormatTime(obj.getcreateDate(),"yyyy-MM-dd"));
        }
        rows.add(row);
        data.setRows(rows);
        ExportExcelUtils.exportExcel(response,"ProductExport.xlsx",data);
    }




}
