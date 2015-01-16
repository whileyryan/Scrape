window.setInterval(function(){
  getWebsites();
}, 600000);

function getWebsites(){
  $.ajax({
    url: '/getAutoWebsites',
    type: 'post'
  }).done(function(response){
    console.log('Success');
  }) 
} 

$(document).ready(function(){
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  });
})