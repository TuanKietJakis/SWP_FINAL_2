let error = document.getElementById("Forgotpassword_error");

let close = document.getElementById("close");
let form = document.getElementById("form_forgot");

close.addEventListener("click", () => {
  error.classList.remove("error_show");
});

form.addEventListener("submit", function (event) {
  let msg = "";
  let error_msg = document.getElementById("error_msg");
  let Email = document.getElementById("Email").value;
  let valid = true;
  if (Email === "" || Email === null) {
    msg += "Please enter your email";
    valid = false;
  } 

  if (valid == false) {
    error.classList.add("error_show");
    error_msg.innerHTML = msg;
    event.preventDefault();
  }
});