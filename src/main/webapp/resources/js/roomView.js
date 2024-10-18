$(document).ready(function() {
    const track = $('#sliderTrack');
    const slideItems = $('.slider-item');
    let slideWidth = slideItems.outerWidth(true); // 슬라이드 아이템의 전체 너비
    let slideCount = slideItems.length; // 슬라이드 아이템의 개수
    let currentPosition = -slideWidth; // 초기 위치를 첫 번째 복제 슬라이드로 이동
    let isAnimating = false;
    let sliderInterval;

    // 앞과 뒤에 슬라이드 복제하여 무한 순환 구현
    const firstClone = slideItems.first().clone();
    const lastClone = slideItems.last().clone();
    
    track.prepend(lastClone);
    track.append(firstClone);

    // 트랙의 총 너비 설정
    track.css('width', slideWidth * (slideCount + 2) + 'px'); // 클론된 슬라이드 포함
    track.css('transform', 'translateX(' + currentPosition + 'px)'); // 첫 번째 슬라이드로 이동

    function moveSlider() {
        if (isAnimating) return;
        isAnimating = true;
        
        currentPosition -= slideWidth;

        track.css('transition', 'transform 0.8s ease'); // 부드럽게 애니메이션
        track.css('transform', 'translateX(' + currentPosition + 'px)');

        // 마지막 복제 슬라이드에 도착했을 경우
        if (Math.abs(currentPosition) >= slideWidth * slideCount) {
            setTimeout(function() {
                // 애니메이션 없이 첫 번째 슬라이드로 순간적으로 이동
                track.css('transition', 'none');
                currentPosition = -slideWidth; // 첫 번째 슬라이드로 이동
                track.css('transform', 'translateX(' + currentPosition + 'px)');
                setTimeout(function() {
                    // 애니메이션 복구
                    track.css('transition', 'transform 0.8s ease');
                    isAnimating = false;
                }, 50); // 50ms 후 애니메이션 복구
            }, 800); // 슬라이드 애니메이션 끝난 후
        } else {
            // 다음 슬라이드로 자연스럽게 이동
            setTimeout(function() {
                isAnimating = false;
            }, 800); // 애니메이션 시간과 동일하게 설정
        }
    }

    // 슬라이드 자동 이동 함수 시작
    function startSlider() {
        sliderInterval = setInterval(moveSlider, 2300); // 2.3초마다 슬라이드 이동
    }

    // 슬라이드 자동 이동 중지 함수
    function stopSlider() {
        clearInterval(sliderInterval); // 슬라이드 중지
    }

    // 마우스 호버 시 슬라이드 멈춤
    $('.slider-item').on('mouseenter', function() {
        stopSlider();
    });

    // 마우스 호버 아웃 시 슬라이드 재개
    $('.slider-item').on('mouseleave', function() {
        startSlider();
    });

    // 스크롤바를 드래그할 때 슬라이드 이동
    $('#sliderContainer').on('scroll', function() {
        let scrollLeft = $(this).scrollLeft();
        currentPosition = -scrollLeft;
        track.css('transform', 'translateX(' + currentPosition + 'px)');
    });

    // 스크롤바 숨기기 및 마우스 호버 시 보이기
    $('#sliderContainer').hover(
        function() {
            $(this).css('overflow-x', 'scroll');
        }, 
        function() {
            $(this).css('overflow-x', 'hidden');
        }
    );

    // 터치 및 드래그를 통한 슬라이더 이동
    const sliderContainer = document.getElementById('sliderContainer');
    let isDown = false;
    let startX;
    let scrollLeft;

    sliderContainer.addEventListener('mousedown', (e) => {
        isDown = true;
        sliderContainer.classList.add('active');
        startX = e.pageX - sliderContainer.offsetLeft;
        scrollLeft = sliderContainer.scrollLeft;
        stopSlider(); // 마우스 다운 시 슬라이더 멈춤
    });

    sliderContainer.addEventListener('mouseleave', () => {
        isDown = false;
        sliderContainer.classList.remove('active');
        startSlider(); // 마우스가 떠나면 슬라이더 다시 시작
    });

    sliderContainer.addEventListener('mouseup', () => {
        isDown = false;
        sliderContainer.classList.remove('active');
        startSlider(); // 마우스를 떼면 슬라이더 다시 시작
    });

    sliderContainer.addEventListener('mousemove', (e) => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - sliderContainer.offsetLeft;
        const walk = (x - startX) * 2; // 스크롤 속도 조정
        sliderContainer.scrollLeft = scrollLeft - walk;
    });

    // 초기 슬라이드 시작
    startSlider();
});
