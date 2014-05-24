var question_number = 0;
var choice_number = [0]
var question_string = "<div id=\"question\"><label id=\"question_field\">question<input type=\"text\" name=\"question[" + question_number + "][question]\"></label><div id=\"choice\"><label>choice<input type=\"text\" name=\"choice[0][choice]\"></label></div><a href=\"#\" id=\"add_choice\">add choice</a></div> "
var choice_string = "<div id=\"choice\"><label>choice<input type=\"text\" name=\"choice[" + +"][choice]\"></label></div> "

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
