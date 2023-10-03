/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function ValidationDoB() {
    let MN = new Date(document.getElementById("DateInput").value);
    var now = new Date();
    let IsDateValid = false;
    var futureDate = new Date();
    futureDate.setMonth(futureDate.getMonth() + 2);
    if (MN > now && MN <= futureDate) {
        document.getElementById("ErrorDate").innerHTML = "";
        IsDateValid = true;
    } else {
        document.getElementById("ErrorDate").innerHTML = "Date must be in the future and under 2 months";

    }
    return IsDateValid;
}

function ValidationMobilePhone() {
    let MN = document.getElementById("PhoneNumber").value;
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



function ValidationDeliveryInstruction() {
    let DI = document.getElementById("DeliveryInstruction").value;
    let IsDIValid = false;
    if (DI.length < 2) {
        IsDIValid = true;
    } else {
        document.getElementById("ErrorDI").innerHTML = "Delivery Instruction can't be empty and more than 255 chars!";
    }
    return IsDIValid;
}


function ValidationDeliveryAddress() {
    let DA = document.getElementById("DeliveryAddress").value;
    let IDAValid = false;
    if (DA.length < 2) {
        IDAValid = true;
    } else {
        document.getElementById("ErrorDA").innerHTML = "Delivery Address can't be empty and more than 255 chars!";
    }
    return IDAValid;
}

function validateOrderInput() {
    Mobile = ValidationMobilePhone();
    Instruction = ValidationDeliveryInstruction();
    Address = ValidationDeliveryAddress();
    isValid = Mobile && Instruction &&  Address;
    return isValid;
}
