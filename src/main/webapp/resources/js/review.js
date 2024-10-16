$(document).ready(function() {
    // Update button click
    $('.update-btn').click(function() {
        const reviewId = $(this).data('id');
        window.location.href = '/review/update?reviewId=' + reviewId;
    });

    // Delete button click
    $('.delete-btn').click(function() {
        const reviewId = $(this).data('id');
        if (confirm('정말로 리뷰를 삭제하시겠습니까?')) {
            $.ajax({
                url: '/review/delete',
                type: 'POST',
                data: { reviewId: reviewId },
                success: function(response) {
                    alert('Review deleted successfully!');
                    location.reload(); // Refresh page after deletion
                },
                error: function(err) {
                    alert('Error deleting review');
                }
            });
        }
    });
});
