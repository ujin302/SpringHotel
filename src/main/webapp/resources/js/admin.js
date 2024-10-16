$(function(){
    $('#updateRoomInfo').submit(function(event){
        event.preventDefault(); 

        let formData = new FormData(this); 

        $.ajax({
            type: 'POST',
            url: '/SpringHotel/admin/update',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            success: function(data){
                //alert(data); 
                // 페이지 이동
                location.href = "/SpringHotel/admin/updateRoom";
            },
            error: function(e){
                console.log(e); 
            }
        });
    });
});
