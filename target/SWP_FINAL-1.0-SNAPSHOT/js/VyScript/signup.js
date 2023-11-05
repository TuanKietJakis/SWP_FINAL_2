/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let error = document.getElementById("Signup_error");


let close = document.getElementById("close");
if (error) {
    close.addEventListener("click", () => {
        error.classList.remove("error_show");
    });
}

document.getElementById('agree-checkbox').addEventListener('change', function () {
    if (this.checked) {
        document.getElementById('Signup_btn').disabled = false;
    } else {
        document.getElementById('Signup_btn').disabled = true;
    }
});
let form = document.getElementById("form_sign_up");

form.addEventListener("submit", function (event) {
    let msg = "";
    let error_msg = document.getElementById("error_msg");
    let username = document.getElementById("username").value;
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let valid = true;
    if (username === "" || username === null) {
        msg += "Username is empty - ";
        // error.classList.add("error_show");
        valid = false;
    } else if (username.length > 50) {
        msg += "Username must less than 50 - ";
        // error.classList.add("error_show");
        valid = false;
    } else if (!/^[A-Za-z]+[\w\s]*$/.test(username)) {
        msg += "Username not start with number or no letter in name - ";
        valid = false;
    }



    const emailInput = document.getElementById('email');
    const emailValue = emailInput.value;

    const emailRegex = /^[a-zA-Z]+[a-zA-Z0-9._-]+@[a-zA-Z._-]+\.[a-zA-Z.]{2,}$/;
    if (email === "" || email === null) {
        msg += "Email is empty - ";
        // error.classList.add("error_show");
        valid = false;
    } else
    if (!emailRegex.test(emailValue)) {
        // Invalid email address
        msg += "Email must be 'Example@gmail.com' - ";
        valid = false;
    }

    if (password.length < 6) {
        msg += "Password must be more than 8 characters - ";
        valid = false;
    }
    if (password.length > 32) {
        msg += "Password must be less than 32 characters - ";
        valid = false;
    }
    if (valid == false) {
        error.classList.add("error_show");
        error_msg.innerHTML = msg.substring(0, msg.length - 2);
        event.preventDefault();
    }
})