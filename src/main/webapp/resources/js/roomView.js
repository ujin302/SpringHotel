$(document).ready(function() {
    const track = $('#sliderTrack');
    const slideItems = $('.slider-item');
    let slideWidth = slideItems.outerWidth(true);
    let slideCount = slideItems.length;
    let currentPosition = -slideWidth; 
    let isAnimating = false;
    let sliderInterval;

    // 슬라이드 복제
    const firstClone = slideItems.first().clone();
    const lastClone = slideItems.last().clone();
    
    track.prepend(lastClone);
    track.append(firstClone);

    // 트랙의 총 너비 설정
    track.css('width', slideWidth * (slideCount + 2) + 'px'); 
    track.css('transform', 'translateX(' + currentPosition + 'px)');

    // 슬라이드 이동 함수
    function moveSlider() {
        if (isAnimating) return;
        isAnimating = true;
        
        currentPosition -= slideWidth;

        track.css('transition', 'transform 1s ease'); // 부드러운 애니메이션
        track.css('transform', 'translateX(' + currentPosition + 'px)');

        // 마지막 슬라이드에 도착했을 때
        if (Math.abs(currentPosition) >= slideWidth * slideCount) {
            setTimeout(function() {
                track.css('transition', 'none');
                currentPosition = -slideWidth; 
                track.css('transform', 'translateX(' + currentPosition + 'px)');
                setTimeout(function() {
                    track.css('transition', 'transform 1s ease');
                    isAnimating = false;
                }, 50);
            }, 1000);
        } else {
            setTimeout(function() {
                isAnimating = false;
            }, 1000);
        }
    }

    // 슬라이드 자동 이동 시작
    function startSlider() {
        sliderInterval = setInterval(moveSlider, 3000); // 3초로 변경
    }

    // 슬라이드 자동 이동 중지
    function stopSlider() {
        clearInterval(sliderInterval);
    }

    // 마우스/터치 호버 시 슬라이드 멈춤
    $('.slider-item').on('mouseenter touchstart', function() {
        stopSlider();
    });

    // 마우스/터치 아웃 시 슬라이드 재개
    $('.slider-item').on('mouseleave touchend', function() {
        startSlider();
    });

    // 초기 슬라이드 시작
    startSlider();
});
