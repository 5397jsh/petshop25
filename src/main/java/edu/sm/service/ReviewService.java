package edu.sm.service;

import edu.sm.dto.Review;
import edu.sm.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public List<Review> getByProduct(int productId) {
        return reviewRepository.selectByProduct(productId);
    }

    public Review select(int reviewId) {
        return reviewRepository.select(reviewId);
    }

    public void write(Review review) {
        reviewRepository.insert(review);
    }

    public void modify(Review review) {
        reviewRepository.update(review);
    }

    public void remove(int reviewId) {
        reviewRepository.delete(reviewId);
    }
}