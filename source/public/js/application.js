$(document).ready(function() {
  var question_number = 0;

  $("#add_question").on("click", function(event){
    event.preventDefault();
    question_number += 1;
    $("#questions").append('<div class=\"question\"><div class=\"question_and_choices\"><br><label id=\"question_field\">question <input type=\"text\" name=\"question[0]\"></label><br><label>choice <input type=\"text\" name=\"choice[' + question_number + '][0]\"></label><br><label>choice <input type=\"text\" name=\"choice[' + question_number + '][1]\"></label><br><label>choice <input type=\"text\" name=\"choice[' + question_number + '][2]\"></label><br><label>choice <input type=\"text\" name=\"choice[' + question_number + '][3]\"></label><br></div><div class=\"add_choice\"><a href=\"#\" qNum=' + question_number + '>add choice</a></div></div>')
  });

  $("#questions div div a").on("click", function(event) {
  	event.preventDefault();
  	console.log('clicked');
  	console.log(this);
  })
});

// $("#questions div:nth-child(2) div:nth-child(2) a")

// $(document).ready(function() {
//   var question_number = 0;
//   var choice_number = [3];

//   $("#add_question").on("click", function(event){
//     event.preventDefault();
//     question_number += 1;
//     choice_number.push(3);
//     $("#questions").append('<div class=\"question\"><div class=\"choices\"><label>question <input type=\"text\" name=\"question[' + question_number + ']\"></label><br><label>choice <input type=\"text\" name=\"choice[' + question_number + '][0]\"></label><br><label>choice <input type="text" name=\"choice[' + question_number + '][1]\"></label><br><label>choice <input type="text" name=\"choice[' + question_number + '][2]\"></label><br><label>choice <input type="text" name=\"choice[' + question_number + '][3]\"></label></div><a href="#" class="add_choice" qNum=' + question_number + '>add choice</a></div>');
//   });

//   $(".add_choice").on("click", function(event){
//     event.preventDefault();
//     var qnum = $(this).attr("qnum");
//     choice_number[qnum] += 1;
//     console.log("adding a choice");
//     $(this).parent().find(".choices").append('<div id=\"choice\"><label>choice <input type=\"text\"name=\"question[' + qnum + '][' + choice_number[qnum] + ']\"></label></div>');
// });
// })
