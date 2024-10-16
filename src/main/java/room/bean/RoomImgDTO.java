package room.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class RoomImgDTO {
    private int roomImgId;
    private int roomId;
    private String imageFileName;
    private String imageOriginalFileName;

}
