package room.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class RoomImgDTO {
    private int roomImgId;          // roomImg_id
    private int roomId;             // room_id
    private String imageFileName;    // imageFileName
    private String imageOriginalFileName; // imageOriginalFileName
}
