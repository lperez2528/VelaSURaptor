$(document).ready(function(){
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
