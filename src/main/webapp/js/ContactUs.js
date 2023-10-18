let form = document.querySelector('#contact_form');

form.addEventListener("submit", (event) => {
    let valid = true;
    let msg1 = "";
    let msg2 = "";
    let email = document.querySelector('#contact_email').value;
    let content = document.querySelector('#helparea').value;
    var a = document.getElementById("error1");
    var b = document.getElementById("error2");
    if (email == null || email == "") { 
        msg1 += "Email is empty or invalid ";
        valid = false;
    } else {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!email.match(emailPattern)) {
            msg1 += "Email is empty or invalid ";
            valid = false;
        }
    }

    if (content == null || content == "") {
        msg2 += "Content is empty ";
        valid = false;
    } 

    if (valid == false) {
        event.preventDefault();
        a.style.color ="red";
        b.style.color ="red";
        a.textContent = msg1;
        b.textContent = msg2;
        
    }
});

