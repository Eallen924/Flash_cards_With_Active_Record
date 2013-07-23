var dataTransition = function(data){
  console.log(data);
  $('#container').replaceWith(data);
};

$(document).ready(function() {
  $('.start_game').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    $.get(url, dataTransition);
  });

  $('body').on('submit', '#card_question', function(event) {
    event.preventDefault();
    console.log(this);
    var url = $(this).attr('action');
    var userGuess = $(this).serialize();
    $.post(url, userGuess, dataTransition);
  });

  $('body').on('click','#next_card', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    $.get(url, dataTransition);
  });
});
