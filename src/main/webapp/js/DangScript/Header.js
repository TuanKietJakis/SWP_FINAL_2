function scrollHeader() {
    const nav = document.getElementById('header');
    if (this.scrollY >= 200)
        nav.classList.add('scroll-header');
    else
        nav.classList.remove('scroll-header');
}
window.addEventListener('scroll', scrollHeader);


const opt_pro = document.querySelector('.nav_profile_select');
const acc_pro = document.querySelector('.nav_profile');
acc_pro.onclick = function () {
    opt_pro.classList.toggle("nav_profile_show");
};

const acc_glass_btn = document.querySelector('.nav_acc_glass');
const acc_glass_input = document.querySelector('.nav_acc_glass_input');
acc_glass_btn.onclick = function () {
    acc_glass_input.focus();
    acc_glass_input.classList.add("nav_acc_glass_show");
    document.querySelector('.nav_acc_search_result').style.display = "block";
    acc_glass_input.addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            window.location.href = '/Shop/Search=' + acc_glass_input.value + '';
        }
    });
    acc_glass_input.onblur = function () {
        setTimeout(function () {
            acc_glass_input.classList.remove("nav_acc_glass_show");
            document.querySelector('.nav_acc_search_result').style.display = "none";
        }, 100);

    }
};
const hoverCart1 = document.querySelector('.nav_acc_cart');
// const hoverCart = document.querySelector('.nav_acc_cart');
hoverCart1.addEventListener('mouseover', () => {
    const CartItem = document.querySelector('.nav_acc_cart_area');
    CartItem.classList.add("show_cart_popup");
});
const CartItem = document.querySelector('.nav_acc_cart_area');
CartItem.addEventListener('mouseleave', () => {
    CartItem.classList.remove("show_cart_popup");
});

document.querySelector('.nav_acc_cart').addEventListener('mouseover', () => {
    const UserID = CartItem.querySelector('#UserID').value;
    $.ajax({
        method: "POST",
        url: "/Home",
        data: {
            UserID: UserID,
            action: "recentCart"
        },
        success: function (data) {
            $('.nav_a_c_r_list').empty();
            if (data.length > 0) {
                $.each(data, function (index, value) {
                    // Assuming your HTML has a div with the class 'product-container'
                    $('.nav_a_c_r_list').append(`
                <div class="nav_a_c_r_item" onclick="location.href='${value.productID}'">
                    <div class="nav_a_c_r_i_img"><img src="${value.productImageURL}" alt=""></div>
                    <p class="nav_a_c_r_i_name">${value.productName}</p>
                    <p class="nav_a_r_i_price">$${value.productPrice}</p>
                </div>

                `);
                });
            } else {
                $('.nav_a_c_r_list').append(`
                <div class="nav_a_c_r_item">
                    <p style="text-align:center;width=100%;">No item in Cart</p>
                </div>
                `);
            }
        }
    });
});
window.addEventListener("load", () => {
    const UserID = CartItem.querySelector('#UserID').value;
    $.ajax({
        method: "POST",
        url: "/Home",
        data: {
            UserID: UserID,
            action: "showNumberItem"
        },
        success: function (data) {
            if (data.numberItem === 0) {
                document.querySelector('.number_of_item').remove();
            } else {
                if (document.querySelector('.number_of_item') !== null) {
                    document.querySelector('.number_of_item').remove();
                }

                $('.cart_item').append(`
                <span class="number_of_item">${data.numberItem}</span>
                `);
            }
        }
    });
});
document.querySelector('.nav_acc_glass_input').addEventListener('input', () => {
    var inputValue = document.querySelector('.nav_acc_glass_input').value;
    if (inputValue === "" && $('.search_result_list') !== null) {
        $('.search_result_list').empty();
    } else {
        $.ajax({
            method: "POST",
            url: "/Home",
            data: {
                inputValue: inputValue,
                action: "searchInput"
            },
            success: function (data) {
                if (data.length > 0) {
                    $('.search_result_list').empty();
                    $.each(data, function (index, value) {
                        // Assuming your HTML has a div with the class 'product-container'
                        $('.search_result_list').append(`
                              <div class="search_result_item" onclick="location.href='/Shop/Detail/${value.productID}'">
                                           <div class="search_result_item_img"><img src="${value.productImageURL}" alt=""></div>
                                           <div class="search_result_item_data">
                                               <h1 class="search_result_item_name">${value.productName}</h1>
                                            <p class="search_result_price">$${value.price}</p>
                                           </div>
                               </div>
                      `);
                    });
                    $('.search_result_list').append(`
                              <div class="search_result_more">
                                        <a href="/Shop/Search=${inputValue}" class="search_result_more_link">Show More</a>
                                    </div>
                      `);


                } else {
                    $('.search_result_list').empty();
                }
            }
        });
    }
});

//                <div class="nav_a_c_r_item" onclick="location.href='${value.productID}'">
//                    <div class="nav_a_c_r_i_img"><img src="${value.productImageURL}" alt=""></div>
//                    <p class="nav_a_c_r_i_name">${value.productName}</p>
//                    <p class="nav_a_r_i_price">$${value.productPrice}</p>
//                </div>
