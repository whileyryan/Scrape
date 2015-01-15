window.setInterval(function(){
  getWebsites();
}, 60000);

function getWebsites(){
  $.ajax({
    url: '/getAutoWebsites',
    type: 'post'
  }).done(function(response){
    console.log(done);
  }) 
} 