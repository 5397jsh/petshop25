package edu.sm.repository;

import edu.sm.dto.Cust;
import edu.sm.dto.Product;
import edu.sm.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProductRepository extends SmRepository<Product, Integer> {
    List<Product> selectByCateId(int cateId);
}