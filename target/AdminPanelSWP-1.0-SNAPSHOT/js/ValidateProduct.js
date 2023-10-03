function ValidationProName() {
    let Account = document.getElementById("name").value;
    let IsNValid = false;
    if (Account.trim() !== "" || Account.length > 50) {
        IsNValid = true;
    } else {
        document.getElementById("ErrorProName").innerHTML = "Name can't be empty or longer than 50 characters!";
    }
    return IsNValid;
}


function ValidationProPrice() {
    let Account = document.getElementById("price").value;
    let IsQValid = false;
    let PhoneStringChecker = /^[0-9]+$/;
    let PhoneNumberRegex = new RegExp(String(PhoneStringChecker).slice(1, -1));
     let CheckPhoneNumber = PhoneNumberRegex.test(Account);
    if (CheckPhoneNumber === true) {
        IsQValid = true;
    } else {
        document.getElementById("ErrorProPrice").innerHTML = "Price must be number only!";
    }
    return IsQValid;
}

function ValidationProSize() {
    let Account = document.getElementById("sizePro").value;
    let IsSValid = false;
    if (Account.trim() !== "" || Account.length > 50) {
        IsSValid = true;
    } else {
        document.getElementById("ErrorProSize").innerHTML = "Size can't be empty or longer than 50 characters!";
    }
    return IsSValid;
}

function ValidationProCountry() {
    let Account = document.getElementById("country").value;
    let IsCValid = false;
    if (Account.trim() !== "" || Account.length > 50) {
        IsCValid= true;
    } else {
        document.getElementById("ErrorProCountry").innerHTML = "Country can't be empty or longer than 50 characters!";
    }
    return IsCValid;
}

function ValidationProID(){
    let Account = document.getElementById("ID").value;
    let IsCValid = false;
    if (Account.trim() !== "" ) {
        IsCValid= true;
    } else {
        document.getElementById("ErrorProCountry").innerHTML = "Country can't be empty or longer than 50 characters!";
    }
    return IsCValid;
}


function ValidAllProductUpdate(){
    IsNValid = ValidationProName();
    IsSValid = ValidationProSize();
    IsQValid = ValidationProPrice();
    IsPValid = ValidationProCountry();
     
     isValidPro = IsNValid && IsSValid && IsQValid && IsPValid;
     return isValidPro;
}

function ValidAllProductCreate(){
    IsNValid = ValidationProName();
    IsSValid = ValidationProSize();
    IsQValid = ValidationProPrice();
    IsPValid = ValidationProCountry();
    IsIDValid = ValidationProID();
     
     isValidPro = IsNValid && IsSValid && IsQValid && IsPValid && IsIDValid ;
     return isValidPro;
}


