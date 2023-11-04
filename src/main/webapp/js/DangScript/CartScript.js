document.addEventListener('DOMContentLoaded', function () {
    const quantityContainers = document.querySelectorAll('.cart_t_i_quantity');

    quantityContainers.forEach(function (container) {
        const decreaseButton = container.querySelector('.decrease');
        const increaseButton = container.querySelector('.increase');
        const quantityInput = container.querySelector('.quantity-input');
        const quantityId = container.getAttribute('data-quantity-id');

        decreaseButton.addEventListener('click', function () {
            decreaseValue(quantityId);
        });

        increaseButton.addEventListener('click', function () {
            increaseValue(quantityId);
        });
    });

    function increaseValue(quantityId) {
        const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
        let value = parseInt(quantityInput.value, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        quantityInput.value = value;
        const event = new Event('input', {
            bubbles: true,
            cancelable: true
        });
        setTimeout(function () {
            quantityInput.dispatchEvent(event);
        }, 1000);

    }

    function decreaseValue(quantityId) {
        const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
        let value = parseInt(quantityInput.value, 10);
        value = isNaN(value) ? 0 : value;
        value < 1 ? (value = 1) : '';
        value--;
        quantityInput.value = value;
        const event = new Event('input', {
            bubbles: true,
            cancelable: true
        });
        setTimeout(function () {
            quantityInput.dispatchEvent(event);
        }, 1000);


    }
});


let form = document.getElementById("cartForm");
if(form){   
form.addEventListener("submit", function (event) {
    let msg = document.querySelector('.error_zone_list');
    msg.innerHTML = "";
//  let error_msg = document.getElementById("error_msg");
    let inputName = document.getElementById("inputFullName").value;
    let inputPhoneNumber = document.getElementById("inputPhoneNumber").value;
    let vnPay = document.getElementById("vnPay");
    let cash = document.getElementById("cash");
    let inputAddress = document.getElementById("inputAddress").value;
    let valid = true;

    if (inputName === "" || inputName === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Name is Empty</li>";
        // error.classList.add("error_show");
        valid = false;
    }

    const te = /^[0][0-9]{9}$/;
    if (inputPhoneNumber === "") {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please fill Phone Number field</li>";

        valid = false;
    } else if (!te.test(inputPhoneNumber)) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Phone Number must be 0123123123</li>";
        valid = false;
    }
    if (!vnPay.checked && !cash.checked) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please choose payment method</li>";
        valid = false;
    }
    if (inputAddress === "" || inputAddress === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Address should not be empty</li>";
        valid = false;
    }

    if (valid === false) {
        document.querySelector('.error_zone').classList.add("showErrorZone");
        event.preventDefault();

    }
});
}
document.querySelector('.error_zone_close').onclick = function () {
    document.querySelector('.error_zone').classList.remove("showErrorZone");
};

document.querySelector('.editAddress').addEventListener('click', () => {
    document.querySelector('.addressManagement').classList.add("showpopup");
    document.querySelector('.popup_bg').classList.add("showbg");
    document.body.style.overflow = "hidden";
});
document.querySelector('#close-popup').addEventListener('click', () => {
    document.querySelector('.addressManagement').classList.remove("showpopup");
    document.querySelector('.popup_bg').classList.remove("showbg");
    document.body.style.overflow = "auto";
});
document.querySelector('#close-popup2').addEventListener('click', () => {
    document.querySelector('.address_m_add').classList.remove("showpopup");
    document.querySelector('.popup_bg').classList.remove("showbg");
    document.body.style.overflow = "auto";
});
document.querySelector('#close-popup3').addEventListener('click', () => {
    document.querySelector('.address_m_edit').classList.remove("showpopup");
    document.querySelector('.popup_bg').classList.remove("showbg");
    document.body.style.overflow = "auto";
});
document.querySelector('#directToAddress').addEventListener('click', () => {
    document.querySelector('.address_m_add').classList.add("showpopup");
    document.querySelector('.addressManagement').classList.remove("showpopup");
});
document.querySelector('.popup_bg').addEventListener('click', () => {
    document.querySelector('.address_m_edit').classList.remove("showpopup");
    document.querySelector('.address_m_add').classList.remove("showpopup");
    document.querySelector('.addressManagement').classList.remove("showpopup");
    document.querySelector('.popup_bg').classList.remove("showbg");
    document.body.style.overflow = "auto";
});

document.querySelector('#backtoAddressManage').addEventListener('click', () => {
    document.querySelector('.address_m_add').classList.remove("showpopup");
    document.querySelector('.addressManagement').classList.add("showpopup");
});
document.querySelector('#backtoAddressManage2').addEventListener('click', () => {
    document.querySelector('.address_m_add').classList.remove("showpopup");
    document.querySelector('.address_m_edit').classList.remove("showpopup");
    document.querySelector('.addressManagement').classList.add("showpopup");
});

document.querySelectorAll('.directToEdit').forEach(n => {
    n.addEventListener('click', () => {
        document.querySelector('.address_m_edit').classList.add("showpopup");
        document.querySelector('.addressManagement').classList.remove("showpopup");
        const FullName = n.getAttribute("data-name");
        const PhoneNumber = n.getAttribute("data-phone");
        const Address = n.getAttribute("data-address");
        const PaymentMethod = n.getAttribute("data-method");
        const AddressID = n.getAttribute("data-id");
        addtoEdit(FullName, PhoneNumber, Address, PaymentMethod, AddressID);
    });
});

function addtoEdit(FullName, PhoneNumber, Address, PaymentMethod, AddressID) {
    $("#txtName").val(FullName);
    $("#txtPhone").val(PhoneNumber);
    $("#txtAddress").val(Address);
    if (PaymentMethod == 1) {
        document.querySelector('#mvnPay').checked = true;
    } else if (PaymentMethod == 2) {
        document.querySelector('#mcash').checked = true;
    }
    $("#addressID").val(AddressID);
}

document.querySelector('#btnSubmitForAdd').addEventListener('click', () => {
    let msg = document.querySelector('.error_zone_list');
    msg.innerHTML = "";
//  let error_msg = document.getElementById("error_msg");
    const inputName = document.getElementById("txtName1").value;
    const inputPhoneNumber = document.getElementById("txtPhone1").value;
    const vnPay = document.getElementById("mvnPay1");
    const cash = document.getElementById("mcash1");
    const inputAddress = document.getElementById("txtAddress1").value;
    let payment = 2;
    if (vnPay.checked) {
        payment = 1;
    }
    let valid = true;

    if (inputName === "" || inputName === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Name is Empty</li>";
        // error.classList.add("error_show");
        valid = false;
    }

    const te = /^[0][0-9]{9}$/;
    if (inputPhoneNumber === "") {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please fill Phone Number field</li>";

        valid = false;
    } else if (!te.test(inputPhoneNumber)) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Phone Number must be 0123123123</li>";
        valid = false;
    }
    if (!vnPay.checked && !cash.checked) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please choose payment method</li>";
        valid = false;
    }
    if (inputAddress === "" || inputAddress === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Address should not be empty</li>";
        valid = false;
    }

    if (valid === false) {
        document.querySelector('.error_zone').classList.add("showErrorZone");
    } else {
        const ID = document.querySelector('#btnSubmitForAdd').getAttribute("data-id");
        $.ajax({
            type: "POST",
            url: "/Cart",
            data: {
                userID: ID,
                inputName: inputName,
                inputPhoneNumber: inputPhoneNumber,
                payment: payment,
                inputAddress: inputAddress,
                action: "importAddress"
            },
            success: function (data) {
//                if (data.message == "success") {
//                    window.location.reload();
//                    alert("Import Successfully");
//                }
                console.log(data);
                alert("Import Successfully!");
                $('.classForAppend').html("");
                $.each(data, function (index, value) {
                    // Assuming your HTML has a div with the class 'product-container'
                    $('.classForAppend').append(`
                 <div class="address_m_row" id="a${value.addressID}">
                                <div class="address_m_info">
                                    <p class="address_m_name">${value.fullName}</p>
                                    <p class="address_m_phone">${value.phoneNumber}</p>
                                    <p class="address_m_address">${value.address}</p>
                                </div>
                                <button class="address_m_func directToEdit" data-id="${value.addressID}" data-address="${value.address}" data-name="${value.fullName}" data-phone="${value.phoneNumber}" data-method="${value.paymentMethod}">
                                    <i class="fa-solid fa-pen"></i>
                                </button>
                            </div>

                `);
                });
                document.querySelectorAll('.directToEdit').forEach(n => {
                    n.addEventListener('click', () => {
                        document.querySelector('.address_m_edit').classList.add("showpopup");
                        document.querySelector('.addressManagement').classList.remove("showpopup");
                        const FullName = n.getAttribute("data-name");
                        const PhoneNumber = n.getAttribute("data-phone");
                        const Address = n.getAttribute("data-address");
                        const PaymentMethod = n.getAttribute("data-method");
                        addtoEdit(FullName, PhoneNumber, Address, PaymentMethod);
                    });
                });
                $('#backtoAddressManage').trigger('click');
            }
        });
    }
});
document.querySelector('#btnSubmitForEdit').addEventListener('click', () => {
    let msg = document.querySelector('.error_zone_list');
    msg.innerHTML = "";
//  let error_msg = document.getElementById("error_msg");
    const inputName = document.getElementById("txtName").value;
    const inputPhoneNumber = document.getElementById("txtPhone").value;
    const vnPay = document.getElementById("mvnPay");
    const cash = document.getElementById("mcash");
    const inputAddress = document.getElementById("txtAddress").value;
    let payment = 2;
    if (vnPay.checked) {
        payment = 1;
    }
    let valid = true;

    if (inputName === "" || inputName === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Name is Empty</li>";
        // error.classList.add("error_show");
        valid = false;
    }

    const te = /^[0][0-9]{9}$/;
    if (inputPhoneNumber === "") {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please fill Phone Number field</li>";

        valid = false;
    } else if (!te.test(inputPhoneNumber)) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Phone Number must be 0123123123</li>";
        valid = false;
    }
    if (!vnPay.checked && !cash.checked) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Please choose payment method</li>";
        valid = false;
    }
    if (inputAddress === "" || inputAddress === null) {
        msg.innerHTML += "<li class=\"error_zone_item\"><i class=\"fa-solid fa-xmark\"></i>Address should not be empty</li>";
        valid = false;
    }

    if (valid === false) {
        document.querySelector('.error_zone').classList.add("showErrorZone");
    } else {
        const ID = document.querySelector('#addressID').value;
        $.ajax({
            type: "POST",
            url: "/Cart",
            data: {
                addressID: ID,
                inputName: inputName,
                inputPhoneNumber: inputPhoneNumber,
                payment: payment,
                inputAddress: inputAddress,
                action: "editAddress"
            },
            success: function (data) {
//                if (data.message == "success") {
//                    window.location.reload();
//                    alert("Import Successfully");
//                }
                alert("Update Successfully!");
                const RowItem = document.querySelector('#a' + data.addressID);
                RowItem.querySelector('.address_m_name').innerHTML = data.fullName;
                RowItem.querySelector('.address_m_phone').innerHTML = data.phoneNumber;
                RowItem.querySelector('.address_m_address').innerHTML = data.address;
                const btn = RowItem.querySelector('.directToEdit');
                btn.setAtribute("data-id", data.addressID);
                btn.setAtribute("data-address", data.address);
                btn.setAtribute("data-name", data.fullName);
                btn.setAtribute("data-phone", data.phoneNumber);
                btn.setAtribute("data-method", ata.paymentMethod);
                $('#backtoAddressManage2').trigger('click');
            }
        });
    }
});
document.querySelector('#btnSubmitForRemove').addEventListener('click', () => {
    const ID = document.querySelector('#addressID').value;
    $.ajax({
        type: "POST",
        url: "/Cart",
        data: {
            addressID: ID,
            action: "removeAddress"
        },
        success: function (data) {
            if (data.message == "success") {
                alert("Remove Successfully!");
               const RowItem = document.querySelector('#a' + ID);
                RowItem.remove();
                $('#backtoAddressManage2').trigger('click');
            } else {
                alert("Opp! Something wrong, Please try again..");
            }
        }
    });
});

$(document).ready(function () {
    let subtotal = document.getElementById("subtotal").value;
    if (subtotal == 0) {
        document.querySelector('.cart_cz_checkout').disabled = true;
    }
    document.querySelector('.cart_dz_data_area');
    $('.cart_dz_select').on('change', function () {
        var ID = $('.cart_dz_select').val();
        $("#action").val("chooseAddress");
        $.ajax({
            method: "GET",
            url: "/Cart",
            data: {
                ID: ID,
                action: "chooseAddress"
            },
            success: function (data) {
                $("#inputFullName").val(data.FullName);
                $("#inputPhoneNumber").val(data.PhoneNumber);
                $("#inputAddress").val(data.Address);
                if (data.PaymentMethod === 1) {
                    document.querySelector('#vnPay').checked = true;
                } else if (data.PaymentMethod === 2) {
                    document.querySelector('#cash').checked = true;
                }

            }
        });
    });
    document.querySelectorAll(".cart_t_item").forEach(n => {
        const deleteBtn = n.querySelector(".cart_t_i_func");
        deleteBtn.addEventListener('click', function () {
            var ProductID = deleteBtn.getAttribute("data-product-id");
            $("#action").val("delete-product");
            $.ajax({
                method: "POST",
                url: "/Cart",
                data: {
                    ProductID: ProductID,
                    action: "delete-product"
                },
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
                success: function (response) {
                    n.remove();
//                    window.location.reload();
                    let subtotal = document.getElementById("subtotal");
                    let total = document.getElementById("total");
                    total.value = parseFloat(total.value) - parseFloat(subtotal.value);
                    subtotal.value = 0;
                    document.querySelectorAll('.getForUpdate').forEach(element => {
                        const proPrice = element.querySelector(".proPrice").value;
                        const proQuan = element.querySelector(".quantity-input").value;
                        subtotal.value = parseFloat(subtotal.value) + parseFloat(proPrice * proQuan);
                    });
                    total.value = parseFloat(total.value) + parseFloat(subtotal.value);
                    document.querySelector('.subtotalClass').innerHTML = "$" + subtotal.value;
                    document.querySelector('.totalClass').innerHTML = "$" + total.value;

                    if (document.querySelector('[id^="cart"]') == null) {
                        document.querySelector(".noItem").style.display = "block";
                    }
                }
            });
        });
    });

    document.querySelectorAll(".cart_t_item").forEach(element => {
        element.querySelector(".quantity-input").addEventListener('input', function () {
            const ProductPrice = element.querySelector("#proPrice").value;
            const ProductAmount = element.querySelector(".quantity-input").value;
            const CartID = element.querySelector("#proPrice").getAttribute("data-cart-id");
            element.querySelector("#action").value = "update-quan";
            $.ajax({
                method: "POST",
                url: "/Cart",
                data: {
                    ProductPrice: ProductPrice,
                    ProductAmount: ProductAmount,
                    CartID: CartID,
                    action: "update-quan"
                },
                success: function (data) {
                    console.log(data);
                    if (data.delete === "delete") {
                        element.remove();
                        let subtotal = document.getElementById("subtotal");
                        let total = document.getElementById("total");
                        total.value = parseFloat(total.value) - parseFloat(subtotal.value);
                        subtotal.value = 0;
                        document.querySelectorAll('.getForUpdate').forEach(element => {
                            const proPrice = element.querySelector(".proPrice").value;
                            const proQuan = element.querySelector(".quantity-input").value;
                            subtotal.value = parseFloat(subtotal.value) + parseFloat(proPrice * proQuan);
                        });
                        total.value = parseFloat(total.value) + parseFloat(subtotal.value);
                        document.querySelector('.subtotalClass').innerHTML = "$" + subtotal.value;
                        document.querySelector('.totalClass').innerHTML = "$" + total.value;
                    } else if (data.message === "toolarge") {
                        element.querySelector(".quantity-input").value = data.quantity;
                        let subtotal = document.getElementById("subtotal");
                        let total = document.getElementById("total");
                        total.value = parseFloat(total.value) - parseFloat(subtotal.value);
                        subtotal.value = 0;
                        document.querySelectorAll('.getForUpdate').forEach(element => {
                            console.log("KO");
                            const proPrice = element.querySelector(".proPrice").value;
                            const proQuan = element.querySelector(".quantity-input").value;
                            subtotal.value = parseFloat(subtotal.value) + parseFloat(proPrice * proQuan);
                        });
                        total.value = parseFloat(total.value) + parseFloat(subtotal.value);

                        document.querySelector('.subtotalClass').innerHTML = "$" + subtotal.value;
                        document.querySelector('.totalClass').innerHTML = "$" + total.value;
                        alert("Too much You Can not pay for this");


                    } else if (data.message === "success") {
                        let oldAmount = data.oldAmount;
                        let ProductPrice = data.ProductPrice;
                        let ProductAmount = data.ProductAmount;
                        let subtotal = document.getElementById("subtotal");
                        let total = document.getElementById("total");
                        total.value = parseFloat(total.value) - parseFloat(subtotal.value);
                        subtotal.value = 0;
                        document.querySelectorAll('.getForUpdate').forEach(element => {
                            console.log("KO");
                            const proPrice = element.querySelector(".proPrice").value;
                            const proQuan = element.querySelector(".quantity-input").value;
                            subtotal.value = parseFloat(subtotal.value) + parseFloat(proPrice * proQuan);
                        });
                        total.value = parseFloat(total.value) + parseFloat(subtotal.value);
                        document.querySelector('.subtotalClass').innerHTML = "$" + subtotal.value;
                        document.querySelector('.totalClass').innerHTML = "$" + total.value;
                    }
                }
            });
        });
    });

});