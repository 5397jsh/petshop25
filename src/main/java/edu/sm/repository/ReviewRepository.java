package edu.sm.repository;

import edu.sm.dto.Review;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReviewRepository {
    // 특정 상품의 리뷰 목록
    List<Review> selectByProduct(int productId);

    // 리뷰 단일 조회 (필요 시)
    Review select(int reviewId);

    // 리뷰 등록
    void insert(Review review);

    // 리뷰 수정
    void update(Review review);

    // 리뷰 삭제
    void delete(int reviewId);
}
