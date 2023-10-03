//tuankiet
function checkUser() {
    var regex = /^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$/; // Gồm chuỗi và số từ 3 đến 16 ký tự
    var user = document.getElementById('username').value.trim();
    if (!regex.test(user)) {
        document.getElementById("txtUserMessage").innerHTML = "Username is 8-20 characters long Example: luanfpt";
        return false;
    } else {
        document.getElementById("txtUserMessage").innerHTML = "";
        return true;
    }
}

function checkPass() {
    var regex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$/;
    var pass = document.getElementById('password').value.trim();
    if (!regex.test(pass)) {
        document.getElementById("txtPassMessage").innerHTML = "Invalid password,one character,one uppercasse Example: LuanfptA123";
        return false;
    } else {
        document.getElementById("txtPassMessage").innerHTML = "";
        return true;
    }
}

function checkRPass() {
    var regex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$/;
    var pass = document.getElementById('password').value.trim();
    var repass = document.getElementById('repass').value.trim();
    if (pass === repass) {
        document.getElementById("txtRPassMessage").innerHTML = "";
        return true;
    } else {
        document.getElementById("txtRPassMessage").innerHTML = "Passwords are not the same";
        return false;
    }
}

function checkFirst() {
    var regex = /^[a-zA-Z\s]+$/;
    var first = document.getElementById('firstname').value.trim();
    if (!regex.test(first)) {
        document.getElementById("txtFirstMessage").innerHTML = "First is 1-16 characters long ";
        return false;
    } else {
        document.getElementById("txtFirstMessage").innerHTML = "";
        return true;
    }
}

function checkMiddle() {
    var regex = /^[a-zA-Z\s]+$/; // Gồm chuỗi và khoảng trắng
    var middle = document.getElementById('middlename').value.trim();
    if (!regex.test(middle)) {
        document.getElementById("txtMiddleMessage").innerHTML = "Middle is 1-16 characters long";
        return false;
    } else {
        document.getElementById("txtMiddleMessage").innerHTML = "";
        return true;
    }
}

function checkLast() {
    var regex = /^[a-zA-Z\s]+$/; // Gồm chuỗi và khoảng trắng
    var last = document.getElementById('lastname').value.trim();
    if (!regex.test(last)) {
        document.getElementById("txtLastMessage").innerHTML = "Last name must contain at least one alphabet character";
        return false;
    } else {
        document.getElementById("txtLastMessage").innerHTML = "";
        return true;
    }
}
function checkAddress() {
    var regex = /^[a-zA-Z\s\d]+$/; // Gồm chuỗi, số và khoảng trắng
    var address = document.getElementById('address').value.trim();
    if (!regex.test(address)) {
        document.getElementById("txtAddressMessage").innerHTML = "Address must contain at least one alphabet character or number";
        return false;
    } else {
        document.getElementById("txtAddressMessage").innerHTML = "";
        return true;
    }
}

function checkEmail() {
    var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var email = document.getElementById('email').value.trim();
    if (!regex.test(email)) {
        document.getElementById("txtEmailMessage").innerHTML = "Invalid email format Exam:luanfpt@gmail.com";
        return false;
    } else {
        document.getElementById("txtEmailMessage").innerHTML = "";
        return true;
    }
}

function checkDate() {
    var regex = /^(1[89]|[2-9][0-9])\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
    var date = document.getElementById('date').value.trim();
    if (regex.test(date)) {
        var birthday = new Date(date); // Khởi tạo một đối tượng
        var ageDiffMs = Date.now() - birthday.getTime(); // Tính khoảng thời gian giữa ngày hiện tại và ngày sinh
        var ageDate = new Date(ageDiffMs);
        var age = Math.abs(ageDate.getUTCFullYear() - 1970);
        // Tính toán số tuổi bằng cách lấy hiệu giữa năm hiện tại và năm 1970 (năm đầu tiên được hỗ trợ bởi hàm getUTCFullYear() của đối tượng Date).
        if (age < 12) {
            document.getElementById("txtDateMessage").innerHTML = "You must be over 12 years old";
            return false;
        } else {
            document.getElementById("txtDateMessage").innerHTML = "";
            return true;
        }
    } else {
        document.getElementById("txtDateMessage").innerHTML = "Dates must be in the format yyyy-mm-dd";
        return false;
    }
}

function checkPhone() {
    var regex = /^0\d{9,10}$/;
    var phone = document.getElementById('phone').value.trim();
    if (!regex.test(phone)) {
        document.getElementById("txtPhoneMessage").innerHTML = "Invalid phone number Exam: 0976340695";
        return false;
    } else {
        document.getElementById("txtPhoneMessage").innerHTML = "";
        return true;
    }

}
document.querySelector('form').addEventListener('submit', function(event) {
  if (!checkUser() || !checkPass() || !checkRPass() || !checkFirst() || !checkMiddle() || !checkLast() || !checkAddress() || !checkEmail() || !checkDate() || !checkPhone()) {
    event.preventDefault(); // Ngăn chặn việc submit nếu các trường nhập liệu không hợp lệ
        alert("Please check your registration form again");
  }
});