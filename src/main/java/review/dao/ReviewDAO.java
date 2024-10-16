package review.dao;

import review.bean.ReviewDTO;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	public void insertReview(ReviewDTO review) throws Exception;
    public List<ReviewDTO> getAllReviews() throws Exception;
    public void updateReview(ReviewDTO review) throws Exception;
    public void deleteReview(int reviewId) throws Exception;
    public ReviewDTO getReviewById(Integer reviewId);
	public List<ReviewDTO> reviewListByRoom(int roomId);
    
}

