package edu.sm.repository;

import edu.sm.dto.OrderHistory;
import edu.sm.dto.OrderProduct;
import edu.sm.dto.OrderDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderRepository {
    public void insertOrder(OrderProduct order);
    public void insertOrderDetail(OrderDetail detail);

    List<OrderHistory> findByCustId(@Param("custId") String custId);

}
