package edu.sm.repository;

import edu.sm.dto.OrderHistory;
import edu.sm.dto.OrderItem;
import edu.sm.dto.OrderProduct;
import edu.sm.dto.OrderDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderRepository {
    void insertOrder(OrderProduct order);
    void insertOrderDetail(OrderDetail detail);

    List<OrderHistory> findByCustId(@Param("custId") String custId);
    List<OrderItem>   findDetailsByOrderId(int orderId);

    OrderHistory findByOrderId(@Param("orderId") int orderId);
}
