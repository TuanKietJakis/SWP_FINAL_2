/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let error = document.getElementById("Update_error");

let close = document.getElementById("close");
if (error) {
    close.addEventListener("click", () => {
        error.classList.remove("error_show");
    });
}
let form = document.getElementById("form_up_date");
form.addEventListener("submit", function (event) {


    let msg = "";
    let error_msg = document.getElementById("error_msg");
    let fullname = document.querySelector('input[name="Fullname"]').value;
//    let username = document.getElementById("username").value;
    let birthday = document.querySelector('input[name="DoB"]').value;
    let gender = document.querySelector('select[name="slctGender"]').value;
    let phone = document.querySelector('input[name="Mobile_Number"]').value;
    let email = document.getElementById("email").value;
    let address = document.querySelector('input[name="Address"]').value;

    let valid = true;

    if (fullname === "" || fullname === null) {
        msg += "Fullname is empty - ";
        // error.classList.add("error_show");
        valid = false;
    } else if (fullname.length > 50) {
        msg += "Fullname must less than 50 - ";
        // error.classList.add("error_show");
        valid = false;
    } else if (!/^[A-Za-z\s]+$/.test(fullname)) {
        msg += "Fullname must contain only letters - ";
        valid = false;
    }

    if (!birthday) {
        msg += "Birthday is required - ";
        valid = false;
    } else {
        let currentDate = new Date();
        let selectedDate = new Date(birthday);
        if (selectedDate > currentDate) {
            msg += "Birthday cannot be in the future - ";
            valid = false;
        }
    }

    if (gender === "") {
        msg += "Gender is required - ";
        valid = false;
    }

    let phoneRegex = /^0[1-9]\d{8}$/;
    if (!phone.match(phoneRegex)) {
        msg += "Phone number is required and must be a 10-digit number starting with 0. Example: 0987654321. - ";
        valid = false;
    }

    let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!email.match(emailRegex)) {
        msg += "Email is required and must be a valid email address - ";
        valid = false;
    } else if (email.length > 50) {
        msg += "Email must less than 50 - ";
        // error.classList.add("error_show");
        valid = false;
    }

    if (address.trim() === "") {
        msg += "Address is required - ";
        valid = false;
    }


    if (valid === false) {
        error.classList.add("error_show");
        error_msg.innerHTML = msg.substring(0, msg.length - 2);
        event.preventDefault();
    } else {
        alert("Update Successed!"); // Display "Update Successed" if none of the previous conditions are met
    }
});


