/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function ValidationOrderPhoneNumber() {
    let Account = document.getElementById("PhoneNumber").value;
    let IsPhoneNumberValid = false;
    let PhoneStringChecker = /^[0-9]+$/;
    let PhoneNumberRegex = new RegExp(String(PhoneStringChecker).slice(1, -1));
    let CheckPhoneNumber = PhoneNumberRegex.test(Account);
    if (CheckPhoneNumber === true) {
        IsPhoneNumberValid = true;
    } else {
        document.getElementById("ErrorOrderPhoneNumber").innerHTML = "Phone number must be number only!";
    }
    return IsPhoneNumberValid;
}

function ValidationOrderDeliveryAddress() {
    let Account = document.getElementById("DeliveryAddress").value;
    let IsDeliveryAddressValid = false;
    if (Account.trim() !== "" || Account.length > 50) {
        IsDeliveryAddressValid = true;
    } else {
        document.getElementById("ErrorOrderDeliveryAddress").innerHTML = "Address can't be empty or longer than 50 characters!";
    }
    return IsDeliveryAddressValid;
}

function ValidationOrderDate() {
    let Account = document.getElementById("DeliveryDate").value;
    let IsDateValid = false;
    if (Account.trim() !== "") {
        IsDateValid = true;
    } else {
        document.getElementById("ErrorDate").innerHTML = "Date can't be empty";
    }
    return IsDateValid;
}

function ValidOrder() {
    IsPhoneNumber = ValidationOrderPhoneNumber();
    IsDeliveryAddress = ValidationOrderDeliveryAddress();
    IsDeliveryDate = ValidationOrderDate();
    isValidOrder = IsPhoneNumber && IsDeliveryAddress && IsDeliveryDate;
    return isValidOrder;
}


