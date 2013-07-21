// var dataTransition = function(data){
//   $('#container').replaceWith(data);
// };

// $(document).ready(function() {
//   $('#start_game').on('click', function(event){
//     event.preventDefault();
//     var url = $(this).attr('href');
//     $.get(url, dataTransition);
//   });

//   $('#card_question').on('submit', function(event) {
//     event.preventDefault();
//     var url = $(this).attr('action');
//     var userGuess = $(this).serialize();
//     $.post(url, userGuess, dataTransition);
//   });

//   $('#next_card').on('click', function(event){
//     event.preventDefault();
//     var url = $(this).attr('href');
//     $.get(url, dataTransition);
//   });
// });
