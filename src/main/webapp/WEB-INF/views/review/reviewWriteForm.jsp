<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="review-form-container">
    <h2 class="text-center">리뷰 작성</h2>

    <form action="${pageContext.request.contextPath}/review/insertReview" method="post">
        <input type="hidden" name="roomId" value="${roomId}">

        <!-- Room ID -->
        <div class="form-group">
            <label for="roomId">Room ID:</label>
            <input type="text" id="roomId" name="roomId" value="${roomId}" readonly class="form-control" />
        </div>

        <!-- UserName -->
        <div class="form-group">
            <label for="userName">UserName :</label>
            <input type="text" id="userName" name="userName" value="userName" class="form-control" />
        </div>

        <!-- Rating (별점) -->
        <div class="form-group star-rating-container">
            <label for="rating">Rating:</label>
            <div class="star-rating">
                <input type="radio" id="star5" name="rating" value="5" required />
                <label for="star5" class="full" title="5 stars">5</label>

                <input type="radio" id="star4" name="rating" value="4" />
                <label for="star4" class="full" title="4 stars">4</label>

                <input type="radio" id="star3" name="rating" value="3" />
                <label for="star3" class="full" title="3 stars">3</label>

                <input type="radio" id="star2" name="rating" value="2" />
                <label for="star2" class="full" title="2 stars">2</label>

                <input type="radio" id="star1" name="rating" value="1" />
                <label for="star1" class="full" title="1 star">1</label>
            </div>
            <div id="rating-value" class="text-left mt-2">선택한 점수: 없음</div>
        </div>

        <!-- Comment -->
        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea id="comment" name="comment" rows="4" class="form-control" required></textarea>
        </div>

        <!-- Submit and List Buttons -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary">리뷰 작성</button>
            <input type="button" class="btn btn-success" value="List" onclick="window.location.href='${pageContext.request.contextPath}/review/reviewList';">
        </div>
    </form>
</div>

<script>
    // 별점을 선택하면 그 값을 아래에 보여주는 스크립트
    document.querySelectorAll('.star-rating input[type="radio"]').forEach(function (radio) {
        radio.addEventListener('change', function () {
            document.getElementById('rating-value').textContent = '선택한 점수: ' + this.value + '점';
        });
    });
</script>
