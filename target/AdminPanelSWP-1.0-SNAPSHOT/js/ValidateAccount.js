/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




function ValidationMobilePhone() {
    let MN = document.getElementById("MN").value;
    let EmailStringChecker = /^0[1-9][0-9]{8}$/;
    let CheckerString = new RegExp(String(EmailStringChecker).slice(1, -1));
    let CheckMN = CheckerString.test(MN);
    let IsPhoneValid = false;
    if (CheckMN === true) {
        document.getElementById("ErrorMN").innerHTML = "";
        IsPhoneValid = true;
    } else {
        document.getElementById("ErrorMN").innerHTML = "Error Mobile Wrong Format! ex: 0907124350";

    }
    return IsPhoneValid;
}

function ValidationDoB() {
    let MN = new Date(document.getElementById("DoB").value);
    var now = new Date();
    let IsDateValid = false;
    if (MN < now) {
        document.getElementById("ErrorDate").innerHTML = "";
        IsDateValid = true;
    } else {
        document.getElementById("ErrorDate").innerHTML = "Date not exist!";

    }
    return IsDateValid;
}

function ValidationProCountry() {
    let Account = document.getElementById("Address").value;
    let IsAValid = false;
    if ( Account.length < 255) {
        IsAValid = true;
    } else {
        document.getElementById("ErrorAddress").innerHTML = "Address too long, max 255 chars";
    }
    return IsAValid;
}

function ValidationFullname() {
    let Fullname = document.getElementById("FullName").value;
    let IsFValid = false;
    if (Fullname.length < 255) {
        IsFValid = true;
    } else {
        document.getElementById("ErrorFullname").innerHTML = "Fullname too long, max 255 chars";
    }
    return IsFValid;
}   


function ValidationUsername() {
    let username = document.getElementById("Username").value;
    let IsCValid = false;
    if (username.length < 255) {
        IsCValid = true;
    } else {
        document.getElementById("ErrorUsername").innerHTML = "Username too long, max 255 chars";
    }
    return IsCValid;
}

function validateFormUpdate() {

    isMNValid = ValidationMobilePhone();
    isDoBVlid = ValidationDoB();
    isAddressValid = ValidationProCountry();
    isValid = isMNValid && isDoBVlid && isAddressValid;
    return isValid;
}

function validateSignUp(){
    Mobile  = ValidationMobilePhone();
    Username = ValidationUsername();
    Fullname = ValidationFullname();
    Address = ValidationProCountry();
    DoB = ValidationDoB();
    return isValid  =  Mobile &&  Username  && Fullname  &&  Address && DoB;
}


