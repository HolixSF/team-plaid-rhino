$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.answer-question').click(function(e){
    e.preventDefault();

    var url = $(this).attr('href');
    console.log(url);
    $(this).hide();
   var aRequest = $.get(url);
   aRequest.done(function(response){
        console.log(response);
        console.log(this);
        console.log($(this).parent());


            $(".question-comments").append(response);
    })




  })

  // $('.answer_submit').submit(function(e){
  //   e.preventDefault();
  //   $.ajax({url: "/questions/<%=question.id %>/answers/new",
  //       method: 'POST'})
  //   // .done(function(response){
  //           // $(".question-comments").append(response);
  //       })




});
