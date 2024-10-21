
### 🏨 SpringHotel - README.md

---

**SpringHotel**은 **Spring Framework**와 **MySQL**을 기반으로 한 호텔 예약 및 관리 시스템입니다. 고객에게는 간편한 호텔 객실 예약을, 관리자는 예약 및 고객 정보를 효율적으로 관리할 수 있는 시스템을 제공합니다. 주요 기능으로는 **실시간 예약 시스템**, **객실 상세 정보 모달**, **리뷰 작성**, **QnA 기능**, 그리고 **회원가입 시 이메일 인증** 등이 포함되어 있습니다. **Jenkins**를 사용한 **CI/CD 파이프라인**을 통해 자동 배포가 가능하도록 설계되었습니다.

---

## 📋 프로젝트 개요

- **프로젝트 기간**: 2024.10.11 - 2024.10.21
- **팀 구성**: 3명
  - **백엔드 개발**: 예약 및 회원 관리 API 설계
  - **프론트엔드 개발**: UI 설계, 리뷰 시스템, QnA 구현
  - **CI/CD 담당**: Jenkins 기반 자동화 배포 관리
- **목표**: 고객에게 원활한 호텔 예약 경험을 제공하고, 관리자가 효율적으로 운영을 관리할 수 있는 시스템을 구축하는 것을 목표로 했습니다.

---

## 📂 프로젝트 구조

### 1. **Front-End**

- **JSP**: 동적 웹 페이지 생성을 통해 실시간 데이터를 처리하고 사용자에게 최신 정보 제공
- **CSS & Bootstrap**: 반응형 웹 디자인으로 다양한 기기에서 일관된 사용자 경험 제공
- **JavaScript (AJAX)**: 비동기 요청으로 실시간 상태 업데이트 및 동적 UI 구현
- **jQuery**: DOM 조작 및 이벤트 핸들링을 간편하게 수행

### 2. **Back-End**

- **Spring Framework**: RESTful API로 클라이언트-서버 간 데이터 통신 처리
- **Spring Security**: 이메일 인증을 포함한 사용자 인증 및 권한 관리
- **MySQL**: 관계형 데이터베이스로 예약, 회원, 리뷰 및 QnA 데이터 관리

### 3. **DevOps 및 기타**

- **Naver Cloud Platform**: 클라우드 배포를 통해 서버 확장성 및 안정성 제공
- **Jenkins**: CI/CD 파이프라인으로 자동화된 빌드, 테스트 및 배포 처리
- **Maven**: 의존성 관리 및 빌드 자동화
- **GitHub**: 코드 버전 관리 및 팀 협업 지원

---

## 🛠 주요 기능

1. **호텔 예약 시스템**
   - **실시간 객실 조회 및 필터링**: 사용자가 가격, 위치, 시설 등의 조건으로 예약 가능한 객실을 실시간으로 조회 가능
   - **예약 기능**: 날짜, 인원 등의 정보를 입력해 예약을 완료하며, 예약 상태가 실시간으로 업데이트됨
   - **예약 내역 관리**: 고객이 예약 내역을 확인하고 변경 및 취소할 수 있음

2. **객실 상세 정보 모달**
   - **모달 창 구현**: 각 객실의 상세 정보(사진, 설명, 편의시설)를 제공하여 예약 전 충분한 정보 제공

3. **리뷰 및 평점 시스템**
   - **리뷰 작성 기능**: 고객이 이용한 객실에 대해 리뷰를 작성하고 평점을 남길 수 있음
   - **리뷰 목록 조회**: 다른 고객들의 후기를 확인할 수 있음

4. **회원가입 시 이메일 인증**
   - **API를 통한 이메일 인증**: 회원가입 시 인증 메일 발송 후 사용자가 계정 활성화를 완료해야 함
   - **Spring Security**와 연동된 인증 시스템

5. **QnA 시스템**
   - **QnA 작성 및 답변**: 고객은 호텔에 대한 문의를 할 수 있고, 관리자는 해당 질문에 답변을 제공

6. **관리자 시스템**
   - **예약 관리**: 관리자는 모든 예약을 조회하고, 예약 상태를 변경할 수 있음
   - **고객 관리**: 고객 정보를 조회 및 수정 가능
   - **객실 관리**: 객실 정보를 추가, 수정, 삭제할 수 있음

---

## 🌟 주요 도전 과제 및 해결 방안

1. **동시성 문제 해결**
   - **문제**: 다수의 사용자가 동시에 예약을 시도할 때 발생하는 충돌 문제
   - **해결 방안**: 트랜잭션 및 큐 기반 처리를 통해 동시성 문제를 해결하고 데이터 무결성 유지

2. **이메일 인증 문제 해결**
   - **문제**: 회원가입 시 이메일 인증 지연 및 실패
   - **해결 방안**: 안정적인 이메일 API를 통합하여 신속한 이메일 전송 및 인증 절차 구축

3. **예약 시스템 성능 최적화**
   - **문제**: 성수기 예약 요청 폭증 시 서버 과부하 발생
   - **해결 방안**: 효율적인 데이터베이스 최적화 및 캐싱 도입으로 성능 개선

---

## ✨ 주요 화면

### 1. **메인 페이지**
- **검색 바**: 사용자는 원하는 날짜, 인원, 객실 유형을 입력해 실시간으로 예약 가능한 객실을 확인할 수 있음
- **필터 옵션**: 가격대, 시설 등을 기준으로 객실을 필터링 가능

---

### 2. **객실 상세 정보 모달**
- 선택한 객실의 **상세 설명**, 가격, 편의시설, 리뷰를 모달로 제공

---

### 3. **예약 페이지**
- 객실 선택 후, 날짜와 인원을 입력하여 예약 진행 및 최종 예약 요약 확인

---

### 4. **회원가입 및 이메일 인증**
- 회원가입 시, 고객이 이메일 인증을 완료해야 계정이 활성화됨

---

### 5. **관리자 페이지**
- 예약 관리, 고객 정보 수정, 객실 관리 등을 실시간으로 처리 가능

---

## 결론 및 성과

**SpringHotel** 프로젝트는 효율적인 예약 및 관리 시스템을 구현하여 사용자가 원활하게 호텔 예약을 진행할 수 있도록 했습니다. **CI/CD** 파이프라인을 통해 지속적인 통합 및 자동 배포 환경을 구축했으며, 이메일 인증을 통한 보안 기능 강화로 신뢰성 높은 시스템을 제공했습니다.

### 주요 성과:
- **동시성 문제 해결**: 다수의 사용자가 동시에 접근해도 안정적인 예약 시스템 운영
- **고객 만족도 향상**: 직관적이고 반응형 UI로 사용자의 편의성을 높임
- **자동화된 배포**: CI/CD를 통한 배포 자동화로 개발 효율성 증대

해당 프로젝트는 지속적인 유지보수 및 기능 확장이 용이하며, 팀 협업을 통해 성공적으로 완료되었습니다.

---

## 🔗 프로젝트 링크

- [프로젝트 Notion 페이지](https://fresh-second-b8f.notion.site/241017_Spring-Hotel-11e42d6fe7d7801b9127dfdf9a6cc0c6)
- [GitHub 저장소](https://github.com/ujin302/SpringHotel)

---
