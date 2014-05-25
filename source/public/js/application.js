$(document).ready(function() {
  var question_number = 0;

  $("#add_question").on("click", function(event){
    event.preventDefault();
    question_number += 1;
    console.log(question_number);
    $("#question").append('<br><div class=\"question\"><label>question<input type=\"text\" name=\"question[' + question_number + ']\"></label><br><label>choice<input type=\"text\" name=\"choice[' + question_number + '][0]\"></label><br><label>choice<input type="text" name=\"choice[' + question_number + '][1]\"></label><br><label>choice<input type="text" name=\"choice[' + question_number + '][2]\"></label><br><label>choice<input type="text" name=\"choice[' + question_number + '][3]\"></label></div>');
  });

});
