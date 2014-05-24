var choice_number = 0;
// var choice_increment[question_number] = 0;
var question_string = "<form method=\"post\" action=\"/surveys/new\" id=\"submit_question" + choice_number + "\"><label id=\"question_field\">question<input type=\"text\" name=\"question[question]\"></label><div id=\"choice\"><label>choice<input type=\"text\" name=\"question[choice]\"></label></div><input type=\"submit\" value=\"submit question\" id=\"qbutton\"><a href=\"#\" id=\"add_choice\">add choice</a></form> ";
//var choice_string = "<div id=\"choice\"><label>choice<input type=\"text\" name=\"question[choice" + choice_number + "]\"></label></div>";


// var choice_string = "<div id=\"choice\"><label>choice<input type=\"text\" name=\"qusetion[choice]\"></label></div> "



// $(document).ready(function() {
//   $("#add_question").on("click", function(event){
//     event.preventDefault();
//     question_number += 1;
//     //console.log($("#question_field"));
//     // console.log(existingdiv1);
//     // question = $("#quesiton");
//     // $("#question").append(question, question);
//     $("#question").append(question_string);
//   });


//   $("#add_choice").on("click", function(event){
//     event.preventDefault();
//     //console.log($("#question_field"));
//     // console.log(existingdiv1);
//     // question = $("#quesiton");
//     // $("#question").append(question, question);
//     $("#choice").append(choice_string);
//   });
// });

// $.post( "ajax/test.html", function( data ) {
//   $( ".result" ).html( data );
// });

$(document).ready(function() {
  $("#survey").on("submit", function(event){
    event.preventDefault();
    data = ($(this).serialize())
    $.post("/surveys/new", data, function(){ 
      $("#survey").hide();
      $("#question").append(question_string);
      });
    });
    //$("#question").append(question_string);

    //$("#question").append(question_string);
  $("#submit_question"+ choice_number + "").on("submit", function(event){
    event.preventDefault();
    console.log("default was prevented")
    data = ($(this).serialize())
    $.post("/questions/new", data, function(){
      console.log(data)
      //$("#question:nth-child(last)").hide();
      $("#question").append(question_string);
    });
  });
 
 });


 
// $(document).ready(function() {
//   $("#add_choice").on("click", function(event){
//     event.preventDefault();
//     choice_number += 1
//     $("#choice").append(choice_string);
//   });
// });





   
