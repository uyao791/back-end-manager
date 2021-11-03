package com.backend.manager.service;

import com.backend.manager.dto.ProductSearchDTO;
import com.backend.manager.pojo.Product;
import com.backend.manager.response.PageDataResult;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;


/**
 * @Title: AdminUserService
 * @Description:
 * @author: youqing
 * @version: 1.0
 * @date: 2018/11/21 11:04
 */
public interface ProductService {

    PageDataResult getProductList(ProductSearchDTO product, Integer pageNum, Integer pageSize);

    List<Product> getProductExportList(ProductSearchDTO product);

    Map<String,Object> addProduct(Product user);

    boolean batchImport(String fileName, MultipartFile file) throws Exception;


}
