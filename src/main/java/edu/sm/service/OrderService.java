package edu.sm.service;

import edu.sm.dto.OrderDetail;
import edu.sm.dto.OrderHistory;
import edu.sm.dto.OrderProduct;
import edu.sm.frame.SmService;
import edu.sm.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    final OrderRepository orderRepository;


    @Transactional
    public void registerOrder(OrderProduct order, List<OrderDetail> detailList) throws Exception {
        // 전체 주문 수량 계산
        int totalQuantity = detailList.stream()
                .mapToInt(OrderDetail::getProductQt)
                .sum();

        // OrderProduct에 총 수량 설정
        order.setOrderQt(totalQuantity);

        // 주문 저장
        orderRepository.insertOrder(order);

        // order_id가 자동으로 생성되었다면, detail에도 설정
        int orderId = order.getOrderId();  // useGeneratedKeys="true" 때문에 자동으로 들어감

        for (OrderDetail detail : detailList) {
            detail.setOrderId(orderId);
            orderRepository.insertOrderDetail(detail);
        }
    }
    public List<OrderHistory> getHistory(String custId) {
        return orderRepository.findByCustId(custId);
    }

}