$(function(){
   $('#updateBtn').click(function(){
      let formData = new FormData($('#updateRoomInfo')[0]);
      
      $.ajax({
         type: 'post',
         url: '/SpringHotel/admin/update',
         enctype: 'multipart/form-data',
         processData: false,
         contentType: false,
         data: formData,
         success: function(data){
            alert(data);
            location.href = "/SpringHotel/admin/updateRoom";
         },
         error: function(e){
            console.log(e);
         }
         
      }); //$.ajax
   });
});