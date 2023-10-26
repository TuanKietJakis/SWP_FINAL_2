document.querySelectorAll(".pproduct_wishlist_ico").forEach(n => n.addEventListener('click', () => {
        n.classList.toggle("p_w_ico_animate");
    }));
//document.querySelectorAll(".input_flip").forEach(m => m.addEventListener('click', () => {
//        m.classList.add("input_checkAdd");
//        setTimeout(function () {
//            m.classList.remove("input_checkAdd");
//        }, 2000);
//    }));

document.querySelectorAll('.pproduct_addCart').forEach(product =>
    product.querySelector('.pproduct_addCart_btn').addEventListener('click', () => {
        var ProductID = product.querySelector('#productID').value;
        var UserID = product.querySelector('.pproduct_addCart_btn').getAttribute("data-user-id");
        $("#action").val("addtoCart");
        $.ajax({
            method: "POST",
            url: "/Home",
            data: {
                ProductID: ProductID,
                UserID: UserID,
                action: "addtoCart",
            },
            success: function (data) {
                if (data.message === "success") {
                    var m = product.querySelector('.input_flip');
                    m.classList.add("input_checkAdd");
                    setTimeout(function () {
                        m.classList.remove("input_checkAdd");
                    }, 4000);
                    document.querySelector('.number_of_item').textContent = parseInt(document.querySelector('.number_of_item').textContent) + parseInt(1);
                } else {
                    location.href = '/Login';
                }
            }
        });
    })
);

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