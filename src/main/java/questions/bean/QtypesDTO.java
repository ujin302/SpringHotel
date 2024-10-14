package questions.bean;

import lombok.Data;
import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class QtypesDTO {
    
    private int qtypesId;    // 질문 유형 ID (INT, AUTO_INCREMENT, PRIMARY KEY)
    private String typename; // 질문 유형 이름 (VARCHAR(100), NOT NULL)
}

