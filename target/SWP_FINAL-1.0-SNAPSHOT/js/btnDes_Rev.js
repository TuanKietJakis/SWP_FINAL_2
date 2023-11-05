

// Lấy danh sách tất cả các sản phẩm
//var products = document.querySelectorAll(".col-md-3");
document.querySelector('.des_nav_des').addEventListener('click', () => {
    document.querySelector('.des_nav_des').classList.add("active")
    document.querySelector('.des_content_des').classList.add("active");
    document.querySelector('.des_nav_rev').classList.remove("active");
    document.querySelector('.des_content_rev').classList.remove("active");
});
document.querySelector('.des_nav_rev').addEventListener('click', () => {
    document.querySelector('.des_nav_rev').classList.add("active");
    document.querySelector('.des_content_rev').classList.add("active");
    document.querySelector('.des_nav_des').classList.remove("active")
    document.querySelector('.des_content_des').classList.remove("active");
});

$('.relate_container').owlCarousel({
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






