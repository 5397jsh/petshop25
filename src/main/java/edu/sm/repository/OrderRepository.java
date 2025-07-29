package edu.sm.repository;

import edu.sm.dto.OrderProduct;
import edu.sm.dto.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderRepository {
    public void insertOrder(OrderProduct order);
    public void insertOrderDetail(OrderDetail detail);
}
