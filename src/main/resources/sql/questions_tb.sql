CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, -- 작성자
    admin_id INT, -- 답변자
    content TEXT NOT NULL, -- 질문 내용
    q_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 질문 작성 시간
    is_answered BOOLEAN DEFAULT FALSE,  -- 답변 여부
    updatetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 질문 수정 시간
    type_id INT -- 질문 유형
);
