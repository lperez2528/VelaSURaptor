$(document).ready(function(){

      $(".survey-list").slideDown(1000); 
      $('.question_button').on('click', function(){
      var input = $("<li class='ui-state-default'><div class='question_and_choices well'><p><label for 'create_question'>Question:</label></p><p><input type= 'text' name='question[]' id='question'></p><p><label for 'create_choice'>Choice:</label></p> <p><input type= 'text' name='question[]choice[]' class='choice'></p></div></li>")
 
      $('#sortable').append(input)
    });

    $('.choice_button').on('click', function(){
      var input = $('<p><label for "create_choice" id="create_choice">Choice:</label></p><p><input type= "text" name="question[]choice[]" class="choice"></p>')
 
      $('.choice').last().after(input) 
    });

    $("#sortable").sortable()
    $("#sortable").disableSelection();

})

// charting magic

google.load("visualization", "1", {packages:["corechart"]});

function drawChart(question) {

  console.log("I WAS CALLED")

  var choicesDataArray = [["Choice", "Responses"]]
  for(i=0; i < question.choices.length; i++){
    var choice = question.choices[i]
    choicesDataArray.push([choice.text, choice.takers])
  }

  var data = google.visualization.arrayToDataTable(choicesDataArray);

  var options = {
    gridlines: {count: -1},
    title: question.text,
    backgroundColor: '#DBE2DB',
    colors:["#115229"],
    hAxis: {title: 'Choice', titleTextStyle: {color: '#115229'}},
    vAxis: {format: "#"}
  };

  var chart = new google.visualization.ColumnChart(document.getElementById(question.id.toString()));
  chart.draw(data, options);
}
