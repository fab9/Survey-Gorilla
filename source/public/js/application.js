var question_number = 0;
var choice_increment[question_number] = 0;
var question_string = "<div class=\"question\"><label id=\"question_field\">question<input type=\"text\" name=\"question[" + question_number + "][question]\"></label><div id=\"choice\"><label>choice<input type=\"text\" name=\"question[" + question_number + "][choice]\"></label></div><a href=\"#\" id=\"add_choice\">add choice</a></div> "
var choice_string = "<div id=\"choice\"><label>choice<input type=\"text\" name=\"qusetion[choice]\"></label></div> "



$(document).ready(function() {
  $("#add_question").on("click", function(event){
    event.preventDefault();
    question_number += 1;
    //console.log($("#question_field"));
    // console.log(existingdiv1);
    // question = $("#quesiton");
    // $("#question").append(question, question);
    $("#question").append(question_string);
  });


  $("#add_choice").on("click", function(event){
    event.preventDefault();
    //console.log($("#question_field"));
    // console.log(existingdiv1);
    // question = $("#quesiton");
    // $("#question").append(question, question);
    $("#choice").append(choice_string);
  });
});
