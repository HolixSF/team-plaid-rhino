$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.answer-question').click(function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $(this).hide();
    var aRequest = $.get(url);
    aRequest.done(function(response){
    $(".question-comments").append(response);
    });
  });

 $('.comment-question').click(function(e){
      e.preventDefault();
      $(this).hide();
      var url = $(this).attr('href');
      var bRequest = $.get(url);
      bRequest.done(function(response){
            $(".question-comments").append(response);
    });
  });

 $('.answer-response').click(function(e){
    e.preventDefault();
      $(this).hide();
      var url = $(this).attr('href');
      var obj = $(this)
      var bRequest = $.get(url);
      bRequest.done(function(response){
          obj.parent().append(response)
    });
  });

 

$(".vote-button-upvote-link").click(function(e){
  e.preventDefault();
  var obj = $(this);
  var url = $(this).attr('href');
  console.log('this works');
  debugger
  var bRequest = $.post(url);
  bRequest.done(function(response){
    $("#question-voting").html(response)
  });
    

});


});
