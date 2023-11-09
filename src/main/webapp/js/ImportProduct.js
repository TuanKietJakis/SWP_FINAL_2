let Brand = document.querySelector('#Brand');
let Category = document.querySelector('#Category');
let form = document.querySelector('#update_form');
let input = document.querySelector('#chooseImage')
Brand.addEventListener("change", () => {
    let inputBrand = document.querySelector('#input_brand')
    if (Brand.value == 100) {
        Brand.classList.remove("input_other")
        inputBrand.classList.remove("hide_input")
        Brand.classList.add("input_other_selected")
        inputBrand.classList.add("show_input")
    } else {
        Brand.classList.add("input_other")
        inputBrand.classList.add("hide_input")
        Brand.classList.remove("input_other_selected")
        inputBrand.classList.remove("show_input")
    }
})

Category.addEventListener("change", () => {
    let inputCategory = document.querySelector('#input_category')
    if (Category.value == 100) {
        Category.classList.remove("input_other")
        inputCategory.classList.remove("hide_input")
        Category.classList.add("input_other_selected")
        inputCategory.classList.add("show_input")
    } else {
        Category.classList.add("input_other")
        inputCategory.classList.add("hide_input")
        Category.classList.remove("input_other_selected")
        inputCategory.classList.remove("show_input")
    }
})

form.addEventListener("submit", (e) => {
    let msg1 = "";
    let msg2 = "";
    let msg3 = "";
    let msg4 = "";
    let msg5 = "";
    let msg6 = "";
    let msg7 = "";
    let msg8 = "";
    let isvalid = true;
    let inputBrand = document.querySelector('#input_brand')
    let inputCategory = document.querySelector('#input_category')
    let ProductName = document.querySelector('#email')
    let Price = document.querySelector('#phone')
    let Quantity = document.querySelector('#Quantity')
    let Size = document.querySelector('#size')
    let Des = document.querySelector('#des')
    let OrPrice = document.querySelector('#OrPrice')
    let error_mess = document.querySelector('#error');
    if (Brand.value == 100) {
        if (inputBrand.value == null || inputBrand.value == "") {
            let errorBrand = document.querySelector('.i1')
            errorBrand.classList.remove("hide_error")
            errorBrand.classList.remove("show_error")
            msg1 = ""
            msg1 = "Brand cannot be empty"
            isvalid = false;
        }
    }

    if (Category.value == 100) {
        if (inputCategory.value == null || inputCategory.value == "") {
            let errorCategory = document.querySelector('.i2')
            errorCategory.classList.remove("hide_error")
            errorCategory.classList.remove("show_error")
            msg2 = ""
            msg2 = "Category cannot be empty"
            isvalid = false;
        }
    }

    if (ProductName.value == null || ProductName.value == "") {
        let errorName = document.querySelector('.i3')
        errorName.classList.remove("hide_error")
        errorName.classList.remove("show_error")
        msg3 = ""
        msg3 = "ProductName cannot be empty"
        isvalid = false;
    }
    if (ProductName.value.length < 10) {
        let errorName = document.querySelector('.i3')
        errorName.classList.remove("hide_error")
        errorName.classList.remove("show_error")
        msg3 = ""
        msg3 = "ProductName must be at least 10 characters";
        isvalid = false;
    }

    if(Price.value == null || Price.value == ""){
        let errorprice = document.querySelector('.i4')
        errorprice.classList.remove("hide_error")
        errorprice.classList.remove("show_error")
        msg4 = ""
        msg4 = "Price cannot be empty"
        isvalid = false;
    }else if(isNaN(Price.value)){
        let errorprice = document.querySelector('.i4')
        errorprice.classList.remove("hide_error")
        errorprice.classList.remove("show_error")
        msg4 = ""
        msg4 = "Price must be number"
        isvalid = false;
    }

    if(Quantity.value == null || Quantity.value == ""){
        let errorquantity = document.querySelector('.i5')
        errorquantity.classList.remove("hide_error")
        errorquantity.classList.remove("show_error")
        msg5 = ""
        msg5 = "Quanity cannot be empty"
        isvalid = false;
    }else if(isNaN(Quantity.value)){
        let errorquantity = document.querySelector('.i5')
        errorquantity.classList.remove("hide_error")
        errorquantity.classList.remove("show_error")
        msg5 = ""
        msg5 = "Quantity must be number"
        isvalid = false;
    }

    if(Size.value == null || Size.value == ""){
        let errorSize = document.querySelector('.i6')
        errorSize.classList.remove("hide_error")
        errorSize.classList.remove("show_error")
        msg6 = ""
        msg6 = "Size cannot be empty"
        isvalid = false;
    }else if(isNaN(Size.value)){
        let errorSize = document.querySelector('.i6')
        errorSize.classList.remove("hide_error")
        errorSize.classList.remove("show_error")
        msg6 = ""
        msg6 = "Size must be number"
        isvalid = false;
    }

    if(Des.value==null || Des.value == ""){
        let errorDes = document.querySelector('.i7')
        errorDes.classList.remove("hide_error")
        errorDes.classList.remove("show_error")
        msg7 = ""
        msg7 = "Description cannot be empty"
        isvalid = false;
    }

    if(OrPrice.value == null || OrPrice.value == ""){
        let errorOrPrice = document.querySelector('.i8')
        errorOrPrice.classList.remove("hide_error")
        errorOrPrice.classList.remove("show_error")
        msg8 = ""
        msg8 = "Original Price cannot be empty"
        isvalid = false;
    }else if(isNaN(OrPrice.value)){
        let errorOrPrice = document.querySelector('.i8')
        errorOrPrice.classList.remove("hide_error")
        errorOrPrice.classList.remove("show_error")
        msg8 = ""
        msg8 = "Original Price must be number"
        isvalid = false;
    }

    if (isvalid == false) {
        let errorBrand = document.querySelector('.i1')
        let errorCategory = document.querySelector('.i2')
        let errorName = document.querySelector('.i3')
        let errorprice = document.querySelector('.i4')
        let errorquantity = document.querySelector('.i5')
        let errorSize = document.querySelector('.i6')
        let errorDes = document.querySelector('.i7')
        let errorOrPrice = document.querySelector('.i8')
        errorBrand.innerHTML = msg1
        errorCategory.innerHTML = msg2
        errorName.innerHTML = msg3
        errorprice.innerHTML = msg4
        errorquantity.innerHTML = msg5
        errorSize.innerHTML = msg6
        errorDes.innerHTML = msg7
        errorOrPrice.innerHTML = msg8
        e.preventDefault()
    }
})

input.addEventListener("change", (e)=>{
    let image = document.querySelector('#show_image')
    image.src = URL.createObjectURL(e.target.files[0]);
})