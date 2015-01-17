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
  $('.submit-shit').click(function(){
    var body = ($('.modal-body'));
    var sport_array = []
    for (var i = 0; i < 4; i++){
      if ((body[0]['children'][0][i]['checked']) == true ){
        sport_array.push(body[0]['children'][0][i]['defaultValue'])
      }
    }
    $.ajax({
      url: '/addPackages',
      type: 'get',
      data: {sport: sport_array}
    }).done(function(response){
      console.log('Logged initial packages successfully');
    });
    location.reload();
  })
})