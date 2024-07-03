

//document.querySelectorAll(".input_flip").forEach(m => m.addEventListener('click', () => {
//        m.classList.add("input_checkAdd");
//        setTimeout(function () {
//            m.classList.remove("input_checkAdd");
//        }, 2000);
//    }));

//document.querySelectorAll('.pproduct_addCart').forEach(product =>
//    product.querySelector('.pproduct_addCart_btn').addEventListener('click', () => {
function AddtoCart(element) {
    var ProductID = element.getAttribute("data-product-id");
    var UserID = element.getAttribute("data-user-id");
    $("#action").val("addtoCart");
    $.ajax({
        method: "POST",
        url: "/Home",
        data: {
            ProductID: ProductID,
            Amount: "1",
            UserID: UserID,
            action: "addtoCart"
        },
        success: function (data) {
            if (data.message === "success") {
                var m = $(element).parent(".input_flip");
                m.addClass("input_checkAdd");
                setTimeout(function () {
                    m.removeClass("input_checkAdd");
                }, 4000);
                document.querySelector('.number_of_item').textContent = parseInt(document.querySelector('.number_of_item').textContent) + parseInt(1);
            } else if (data.message === "update") {
                var m = $(element).parent(".input_flip");
                m.addClass("input_checkAdd");
                setTimeout(function () {
                    m.removeClass("input_checkAdd");
                }, 4000);
                document.querySelector('#AmountFromCart').value = data.Amount;
            } else if (data.message === "full") {
                alert("If you want to buy more, we can help you on contact us");
            } else if (data.message === "fail") {
                alert("Some problem drop in here! Please try again")
            } else {
                location.href = '/Login';
            }
        }
    });
}
function AddtoWishlist(element) {
    var ProductID = element.getAttribute("data-product-id");
    var UserID = element.getAttribute("data-user-id");
    $("#action").val("addtoWishlist");
    $.ajax({
        method: "POST",
        url: "/Home",
        data: {
            ProductID: ProductID,
            UserID: UserID,
            action: "addtoWishlist"
        },
        success: function (data) {
            if (data.message === "success") {
                element.classList.add("p_w_ico_animate");
            } else if (data.message === "delete") {
                element.classList.remove("p_w_ico_animate");
            } else if (data.message === "fail") {
                alert("Some problem drop in here, Please try again");
            } else {
                location.href = '/Login';
            }
        }
    });
}
function checkLove(element) {
    if (!element.querySelector('.p_w_ico_animate')){
        var ProductID = element.querySelector('.pproduct_wishlist_ico').getAttribute("data-product-id");
        var UserID = element.querySelector('.pproduct_wishlist_ico').getAttribute("data-user-id");
        $.ajax({
            method: "POST",
            url: "/Home",
            data: {
                ProductID: ProductID,
                UserID: UserID,
                action: "checklist"
            },
            success: function (data) {
                if (data.message === "success") {
                    element.querySelector('.pproduct_wishlist_ico').classList.add("p_w_ico_animate");
                }
            }
        });
    }
}
//    })
//);

$('.home_container').owlCarousel({
    animateOut: 'fadeOut',
    loop: true,
    margin: 0,
    center: true,
    items: 1,
    mouseDrag: false,
    touchDrag: false,
    dots: false,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: false,
});
$('.comment_container').owlCarousel({
    loop: true,
    margin: 0,
    center: true,
    items: 1,
    mouseDrag: false,
    touchDrag: false,
    nav: true,
    dots: false,
    smartSpeed: 500,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: false,
});
$('.mayLike_container').owlCarousel({
    // rtl:true,
    loop: true,
    margin: 0,
    center: false,
    items: 4,
    nav: false,
    dots: false,
    smartSpeed: 400,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
});
$('.logo_container').owlCarousel({
    rtl: true,
    loop: true,
    margin: 30,
    center: false,
    items: 6,
    nav: false,
    dots: false,
    smartSpeed: 400,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: false,
});