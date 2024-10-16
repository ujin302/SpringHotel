package review.service;

import review.bean.ReviewDTO;
import java.util.List;

public interface ReviewService {
	public void insertReview(ReviewDTO review) throws Exception;
    public List<ReviewDTO> getAllReviews() throws Exception;
    public void updateReview(ReviewDTO review) throws Exception;  // 리뷰 업데이트
    public void deleteReview(int reviewId) throws Exception;      // 리뷰 삭제
	public ReviewDTO getReviewById(Integer reviewId);
	public List<ReviewDTO> reviewListByRoom(int roomId);
	public void addReview(ReviewDTO reviewDTO);
	
	
}
