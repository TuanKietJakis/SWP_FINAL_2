/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let error = document.getElementById("Reset_error");

let close = document.getElementById("close");
let form = document.getElementById("Reset_form");

close.addEventListener("click", () => {
  error.classList.remove("error_show");
});

form.addEventListener("submit", function (event) {
  let msg = "";
  let error_msg = document.getElementById("error_msg");
  let newpass = document.getElementById("new").value;
  let reset = document.getElementById("reset").value;
  let valid = true;
  if (newpass === "" || newpass === null) {
    msg += "Please enter your email";
    valid = false;
  } 
  if (reset === "" || reset === null) {
    msg += "Please enter your email";
    valid = false;
  } 

  if (valid == false) {
    error.classList.add("error_show");
    error_msg.innerHTML = msg;
    event.preventDefault();
  }
});