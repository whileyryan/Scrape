window.setInterval(function(){
  getWebsites();
}, 600000);

function getWebsites(){
  $.ajax({
    url: '/getAutoWebsites',
    type: 'post'
  }).done(function(response){
    console.log(done);
  }) 
} 