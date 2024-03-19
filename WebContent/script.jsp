
<!--Login Script Starts-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js" type="text/javascript"></script>
<script type="text/javascript">

function toggle_visibilitylogin(id) {
    var e = document.getElementById(id);
    if(e.style.display == 'block'){
       }
    else{
       e.style.display = 'block';}
 }
 function hideAllButlogin(id) {
 	var e1 = document.getElementById(id);
 	
 	e1.style.display = 'none';
    
     toggle_visibilitylogin(id);
 }
 </script>




<link rel="javascript" type="text/javascript" href="script.js">
	<script src="//code.jquery.com/jquery-1.4.1.js"></script>
  	<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" />
	<script type='text/javascript' src="js/jquery.autocomplete.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery.autocomplete.css" />
	<script>
  $(function() {
    // Setup form validation on the #register-form element
    $("#login-form").validate({
    
        // Specify the validation rules
        rules: {
          
        	
           
            logemail: {
                required: true,
                email: true
            },
            logpassword: {
                required: true,
                minlength: 6
            }
            
        },
        
        // Specify the validation error messages
        messages: {
            logpassword: {
                required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please provide a password</font>",
                minlength: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Weak password</font>"
            },
            
            logemail:{
            	 required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your email address</font>",
            	 email:  "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter a valid email address</font>"
            	
            }
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
  
  //------------------------
 
  $(function() {
    // Setup form validation on the #register-form element
    $("#create-form").validate({
        // Specify the validation rules
        rules: {
          
            fname: {
                required: true,
                minlength: 3
            },
            lname: {
                required: true,
                minlength: 3
            },
            iam: {
                required: true
               
            },
            city: {
                required: true
               
            },
            working: {
                required: true
               
            },
           
            email: {
                required: true,
                email: true
            },
            remail : {
            	required: true,
                email: true,
                equalTo : "#email"
            },
            agree: "required",
            dob: "required",
           
            gender: "required"
            
        },
        
        // Specify the validation error messages
        messages: {
            fname:{
            	required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your first name</font>",
            	 minlength: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Provide minimum 3 characters</font>"
            },
            lname:{
            	required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your last name</font>",
            	 minlength: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Provide minimum 3 characters</font>"
            },
            
            iam:{
            	required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Cannot be empty </font>"
            	
            },
            city:{
            	required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your city</font>"
            	
            },
            working:{
            	required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Cannot be empty </font>"
            	
            },
          
            email:{
            	 required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your email address</font>",
            	 email:  "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter a valid email address</font>"
            	
            },
            remail:{
           	 required: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter your email address</font>",
           	 email:  "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter a valid email address</font>",
           		 equalTo: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Mismatch Email ID</font>"
           },
            agree: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please accept our policy</font>",
           
           	dob: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please provide a Date-of-Birth</font>",
        	gender:"<font color=\"red\">&nbsp;&nbsp;&nbsp;Please select a gender</font>"
            
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
  
  //-------------
   $(function() {
    // Setup form validation on the #register-form element
    $("#profileimage-form").validate({
    
        // Specify the validation rules
        rules: {
          
        	
        	cpass: {
                required: true,
                minlength: 6
            },
            npass: {
                required: true,
                minlength: 6
            },
            keyword: {
                required: true
                
            },
            cat: {
                required: true
                
            },
        	profileimage: {
                required: true
                
            }
           
            
        },
        
        // Specify the validation error messages
        messages: {
        	profileimage: {
                required: "<font color=\"red\"><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please select your profile image</font>"
              
            },
        cpass: {
            required: "<font color=\"red\">&nbsp;Enter Current Password</font>",
            minlength: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Weak password</font>"
          
        },
        keyword: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please enter filter keyword</font>",
        cat: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Please select keyword catagory</font>",
                npass: {
                    required: "<font color=\"red\">&nbsp;Enter New Password</font>",
                    	  minlength: "<font color=\"red\">&nbsp;&nbsp;&nbsp;Weak password</font>"
                  
                }
            
            
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
 
	  //----------postlabel
	    $(function() {
    // Setup form validation on the #register-form element
    $("#postimage-form").validate({
    
        // Specify the validation rules
        rules: {
          
        	sekey: {
                required: true
                
            },
           
        	posttype: {
                required: true
                
            }
           
            
        },
        
        // Specify the validation error messages
        messages: {
        	sekey: {
                required: "<font color=\"red\">&nbsp;&nbsp; * </font>"
              
            },
        	posttype: {
                required: "<font color=\"red\"><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please select your image protection</font>"
              
            }
            
            
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
 
  
</script>