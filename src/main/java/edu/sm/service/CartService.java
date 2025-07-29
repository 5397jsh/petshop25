package edu.sm.service;

import edu.sm.dto.Cart;
import edu.sm.frame.SmService;
import edu.sm.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SmService<Cart, Integer> {

    final CartRepository cartRepository;

    @Override
    public void register(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        cartRepository.update(cart);
    }

    @Override
    public void remove(Integer cartId) throws Exception {
        cartRepository.delete(cartId);
    }

    @Override
    public List<Cart> get() throws Exception {
        return cartRepository.selectAll();
    }

    @Override
    public Cart get(Integer cartId) throws Exception {
        return cartRepository.select(cartId);
    }

    public List<Cart> findByCustId(String custId) throws Exception {
        return cartRepository.findByCustId(custId);
    }
}
