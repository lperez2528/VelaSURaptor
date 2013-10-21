$(document).ready(function(){

      $(".survey-list").slideDown(1000); 
      $('.question_button').on('click', function(){
      var input = $("<li class='ui-state-default'><div class='question_and_choices well'><p><label for 'create_question'>Question:</label></p><p><input type= 'text' name='question[]' id='question'></p><p><label for 'create_choice'>Choice:</label></p> <p><input type= 'text' name='question[]choice[]' class='choice'></p><button class='choice_button btn big'>Add Another Choice</button></div></li>")
 
      $('#sortable').append(input)
    });

    $(document).on('click','.choice_button', function(e){
      e.preventDefault();
      var input = $('<p><label for "create_choice" id="create_choice">Choice:</label></p><p><input type= "text" name="question[]choice[]" class="choice"></p>')
      $(this).before(input) 
    });

    $("#sortable").sortable()
    $("#sortable").disableSelection();

})

// charting magic

google.load("visualization", "1", {packages:["corechart"]});

function drawChart(questions) {

   var options = {
    gridlines: {count: -1},
    backgroundColor: '#DBE2DB',
    colors:["#115229"],
    hAxis: {title: 'Choice', titleTextStyle: {color: '#115229'}},
    vAxis: {format: "#"}
  };

  for(i=0; i<questions.length;i++){
    var question = questions[i]
    options.title = question.text
    var data = google.visualization.arrayToDataTable(question.choices);
    var chart = new google.visualization.ColumnChart(document.getElementById(question.id.toString()));
    chart.draw(data, options);
  }
}
