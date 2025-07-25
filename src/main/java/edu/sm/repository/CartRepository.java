package edu.sm.repository;

import edu.sm.dto.Cart;
import edu.sm.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartRepository extends SmRepository<Cart, Cart> {
    List<Cart> findByCustId(String custId) throws Exception;
}
