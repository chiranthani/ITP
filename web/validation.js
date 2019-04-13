function date_validation(){
    var date = document.getElementById("start").value;

    var ev_date = new Date(date);
    var cur_date = new Date();

    if(ev_date.getTime() > cur_date.getTime()){
        alert("Date should be less than current date");
        return false;
    }
    else{
        return true;
    }
}
function dob_validation() {
    var date = document.getElementById("start").value;

    var ev_date = new Date(date);
    var cur_date = new Date();

    if ((cur_date.getFullYear() - ev_date.getFullYear()) <= 15) {
        alert("Your age should be 15 years or older");
        return false;
    }
    else
        return true;
}
function validation(){
    var date_validate = date_validation();
    var dob_validate = dob_validation();
    var validation1 = validate1();
    
  //  alert("inside the main validation");
  //  alert("date validation : " + date_validate);
  //  alert("dob validation : " + dob_validate);
    
    return date_validate && dob_validate && validation1 ;
}




function validate1()
{
	var firstname = document.forms["account"]["fname"].value;
	var address=document.forms["account"]["address"].value;
        var email=document.forms["account"]["email"].value;
	var contactno=document.forms["account"]["contactno"].value;
        
        if(isAlphebatic(firstname))
        {
            if(adrsValidation(address))
                {
                    if(emailValidation(email))
                    {
                        if(isAlphanumeric(contactno))
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
        }
        else
        {
            return false;
        }
     
}

function validate2(){
    
    var parentName = document.forms["register2"]["pname"].value;
    var parentContactno = document.forms["register2"]["pcontactno"].value;
    var pOccupation = document.forms["register2"]["occupation"].value;
    var wrkngPlceAddress = document.forms["register2"]["wpaddress"].value;
    
        if(pNameValidation(parentName))
        {
            if(isAlphanumeric(parentContactno))
                {
                    if(occValidation(pOccupation))
                    {
                        if(adrsValidation(wrkngPlceAddress))
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
        }
        else
        {
            return false;
        }
}


function validate3(){
    
    var userName = document.forms["register3"]["uname"].value;
    var password1 = document.forms["register3"]["password"].value;
    var cPassword = document.forms["register3"]["password1"].value;
    
        if(unameValidation(userName))
        {                             
            if(password1===cPassword)
            {
                if(passValidation(password1,8))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                alert("Password didn't match");
                return false;
            }
        }
        else
        {
            return false;
        }
}

function validateLogin()
{
    var userName = document.forms["lgnform"]["uname"].value;
    var password = document.forms["lgnform"]["pass"].value;
    
    if(isEmpty(userName)){
    }
    if(isEmpty(password)){
    }
    
}

function isAlphebatic(elemValue)
{
    var exp = /^[a-zA-Z_ ]*$/;
    if(!isEmpty(elemValue))
    {
        if(elemValue.match(exp))
        {
            return true;
        }
        else
        {
            alert("Enter text only for your first / user name");
            return false;
        }
    }
}

function isAlphanumeric(elemValue)
{
	var exp2 = /^[0-9]+$/;
	if(!isEmpty(elemValue))
	{
		if(elemValue.match(exp2))
		{
			return true;
		}
		else
		{
			alert("Enter only the numbers for Contact number");
			return false;
		}
	}
}		

function emailValidation(elemValue)
{
    if(!isEmpty(elemValue))
    {
        var atops = elemValue.indexOf("@");
        var dotops = elemValue.indexOf(".");
        
        if(atops <1 || dotops+2 >=elemValue.length || atops+2>dotops)
        {
            alert("Enter a valid Email Address");
            return false;
        }
        else
        {
            return true;
        }
    }
    else
    {
        return false;
    }
} 

function adrsValidation(elemValue)
{
	if(!isEmpty(elemValue))
	{
                var ex3 = /^[a-zA-Z0-9_ ]*$/;
		if(elemValue.match(ex3))
		{
				return true;
		}
		else
		{
            alert("Enter only text and numbers for address");
            return false;
		}
    }
    else
    {
        return false;
    }
		
	
}


function pNameValidation(elemValue)
{
    var exp = /^[a-zA-Z_ ]+$/;
    if(!isEmpty(elemValue))
    {
        if(elemValue.match(exp))
        {
            return true;
        }
        else
        {
            alert("Enter text only for parent name");
            return false;
        }
    }
}


function occValidation(elemValue)
{
    var exp = /^[a-zA-Z_ ]+$/;
    if(!isEmpty(elemValue))
    {
        if(elemValue.match(exp))
        {
            return true;
        }
        else
        {
            alert("Enter text only for Occupation");
            return false;
        }
    }
}


function passValidation(elemValue,min)
{
    var exp3=/^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/;

    if(!isEmpty(elemValue))
    {
        if(elemValue.length>=min)
        {
            return true;
        }
        else
        {
            alert("Password should at least 8 characters long");
            return false;
        }
    }
    else
    {
        return false;
    }
}


function unameValidation(elemValue)
{
	if(!isEmpty(elemValue))
	{
                var ex3 = /^[a-zA-Z0-9_ ]*$/;
		if(elemValue.match(ex3))
		{
				return true;
		}
		else
		{
            alert("Enter only text and numbers for username");
            return false;
		}
    }
    else
    {
        return false;
    }
		
	
}


function isEmpty(elemValue)
{
    if(elemValue==""  || elemValue==null)
    {
        alert("You cannot keep fields empty");
        return true;
    }
    else
    {
        return false;
    }
}

