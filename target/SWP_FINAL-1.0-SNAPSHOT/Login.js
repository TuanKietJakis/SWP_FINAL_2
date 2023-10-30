/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let error = document.getElementById("Login_error");

// let btn = document.getElementById("Login_btn");
let close = document.getElementById("close");
if(error){
close.addEventListener("click", () => {
  error.classList.remove("error_show");
});}
let form = document.getElementById("form_login");

form.addEventListener("submit", function (event) {
  let msg = "";
  let error_msg = document.getElementById("error_msg");
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let valid = true;
  if (username === "" || username === null) {
    msg += "username is empty, ";
    // error.classList.add("error_show");
    valid = false;
  } else if (username.length > 32) {
    msg += "username is too long, ";
    // error.classList.add("error_show");
    valid = false;
  }

//  if (password.length < 8) {
//    msg += "password must be more than 8 characters, ";
//    console.log(password.length);
//    valid = false;
//  }

  if (valid == false) {
    error.classList.add("error_show");
    error_msg.innerHTML = msg.substring(0, msg.length - 2);
    event.preventDefault();
  }
});