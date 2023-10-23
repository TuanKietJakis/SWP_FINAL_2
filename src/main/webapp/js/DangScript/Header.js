function scrollHeader() {
    const nav = document.getElementById('header');
    if (this.scrollY >= 200) nav.classList.add('scroll-header'); else nav.classList.remove('scroll-header')
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
    acc_glass_input.onblur = function () {
        acc_glass_input.classList.remove("nav_acc_glass_show");
    }
};
const hoverCart1 = document.querySelector('.nav_acc_cart');
// const hoverCart = document.querySelector('.nav_acc_cart');
hoverCart1.addEventListener('mouseover',() => {
const CartItem = document.querySelector('.nav_acc_cart_area');
CartItem.classList.add("show_cart_popup");
});
const CartItem = document.querySelector('.nav_acc_cart_area');
CartItem.addEventListener('mouseleave',()=>{
    CartItem.classList.remove("show_cart_popup");
});