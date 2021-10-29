package com.backend.manager.service.impl;

import com.backend.manager.dao.ProductMapper;
import com.backend.manager.dto.ProductSearchDTO;
import com.backend.manager.pojo.Product;
import com.backend.manager.response.PageDataResult;
import com.backend.manager.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


}
