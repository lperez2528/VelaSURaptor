$(document).ready(function(){
  $(document).on("submit",".signup", function(event){
    var email = $(".signup").find("#email").val();
    var password = $(".signup").find("#password").val();
    var firstName = $(".signup").find("#first_name").val();
    var lastName = $(".signup").find("#last_name").val();

    var errors = checkNameErrors(firstName, lastName).concat(checkEmailErrors(email).concat(checkPasswordErrors(password)));
    
    if (errors.length === 0){
      return true
    }else{
      event.preventDefault();
      var displayErrors = "<ul style='color:red; list-style-type:none'>"
      for(i in errors){
        displayErrors = displayErrors + "<li>" + errors[i] + "</li>"
      }
      displayErrors = displayErrors + "</ul>"
      
      $("#signup-errors").html(displayErrors);
    }
  })
 
})
 
function checkEmailErrors(email){
  var emailRegex = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
  var emailErrors = []
 
  if (!email.match(emailRegex)){
    emailErrors.push("Invalid email")
  }
 
  return emailErrors
 
}
 
function checkPasswordErrors(password){
  var passwordErrors = []
  if(password.length < 8){
    passwordErrors.push("Password must be longer than 8 characters")
  }
 
  if(!password.match(/[a-z]+/)){
    passwordErrors.push("Password must contain at least one lowercase character")
  }
 
   if(!password.match(/[A-Z]+/)){
    passwordErrors.push("Password must contain at least one uppercase character")
  }
 
  return passwordErrors
}

function checkNameErrors(firstName, lastName){
  var nameErrors = []
  if (firstName.length === 0){
    nameErrors.push("First name cannot be blank");
  }

   if (lastName.length === 0){
    nameErrors.push("Last name cannot be blank");
  }

  return nameErrors;
}
