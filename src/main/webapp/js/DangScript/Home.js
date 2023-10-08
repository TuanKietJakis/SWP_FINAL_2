document.querySelectorAll(".pproduct_wishlist_ico").forEach(n => n.addEventListener('click', () => {
    n.classList.toggle("p_w_ico_animate");
}));
document.querySelectorAll(".input_flip").forEach(m => m.addEventListener('click', () => {
    m.classList.add("input_checkAdd");
    setTimeout(function() {
        m.classList.remove("input_checkAdd");
      }, 2000);
}));
$('.home_container').owlCarousel({
    animateOut: 'fadeOut',
    loop: true,
    margin: 0,
    center: true,
    items: 1,
    mouseDrag: false,
    touchDrag:false,
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
    touchDrag:false,
    nav: true,
    dots:false,
    smartSpeed:500,
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
    nav: true,
    dots:false,
    smartSpeed:400,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
});
$('.logo_container').owlCarousel({
    rtl:true,
    loop: true,
    margin: 30,
    center: false,
    items: 6,
    nav: false,
    dots:false,
    smartSpeed:400,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: false,
});