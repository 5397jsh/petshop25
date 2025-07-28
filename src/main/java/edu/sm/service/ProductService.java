package edu.sm.service;

import edu.sm.dto.Cust;
import edu.sm.dto.Product;
import edu.sm.frame.SmService;
import edu.sm.repository.CustRepository;
import edu.sm.repository.ProductRepository;
import edu.sm.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SmService<Product, Integer> {

    final ProductRepository  productRepository;

    @Value("${app.dir.uploadimgsdir}")
    String imgDir;

    @Override
    public void register(Product product) throws Exception {
        if(product.getProductImgFile() != null){
            product.setProductImg(product.getProductImgFile().getOriginalFilename());
            FileUploadUtil.saveFile(product.getProductImgFile(), imgDir);
        }
        productRepository.insert(product);
    }
    @Override
    public void modify(Product product) throws Exception {
        // 기존 DB 정보 가져오기
        Product old = productRepository.select(product.getProductId());

        // 새 이미지 안 올렸으면 기존 이미지 유지
        if (product.getProductImgFile() == null || product.getProductImgFile().isEmpty()) {
            product.setProductImg(old.getProductImg());
        } else {
            // 새 이미지 저장 (덮어쓰기 가능성 있음)
            FileUploadUtil.saveFile(product.getProductImgFile(), imgDir);

            // 새 이미지명 설정
            product.setProductImg(product.getProductImgFile().getOriginalFilename());
        }

        // DB 업데이트
        productRepository.update(product);
    }




    @Override
    public void remove(Integer s) throws Exception {
        productRepository.delete(s);
    }

    @Override
    public List<Product> get() throws Exception {
        return productRepository.selectAll();
    }

    @Override
    public Product get(Integer s) throws Exception {
        return productRepository.select(s);
    }

    public List<Product> getByCateId(int cateId) throws Exception {
        return productRepository.selectByCateId(cateId);
    }

}