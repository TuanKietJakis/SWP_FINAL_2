$(document).ready(function () {
    const UserID = $('#userID').val();
    const limit = 8;
    let start = 0;
    function load_more_data(limit, start) {
        $.ajax({
            url: "/Shop",
            method: "POST",
            data: {
                limit: limit,
                start: start,
                action: "loadmore"
            },
            dataType: 'json',
            success: function (data) {
                $.each(data, function (index, value) {
                    // Assuming your HTML has a div with the class 'product-container'
                    $('.pproduct_content').append(`
                <div class="pproduct_card">
                            <div class="pproduct_data_img" onmouseenter="checkLove(this)">
                                <div onclick="location.href = '/Shop/Detail/${value.productID}'" class="pproduct_data_img_inline"><img src="${value.productImageURL}"
                                                                                                         alt=""></div>
                                <div class="pproduct_wishlist_ico" onclick="AddtoWishlist(this)" data-user-id="${UserID}" data-product-id="${value.productID}">
                                    <button type="button" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </div>
                                <div class="pproduct_addCart">
                                    <div class="input_flip">
                                        <button type="button" class="pproduct_addCart_btn" onclick="AddtoCart(this)" data-user-id="${UserID}" data-product-id="${value.productID}">
                                            <i class="btn_icon_cart fa-solid fa-cart-shopping"></i>
                                            <i class="btn_icon_box fa-solid fa-parachute-box"></i>
                                            <span>Add to cart</span>
                                        </button>
                                        <input type="hidden" id="productID"  value="${value.productID}">
                                        <input type="hidden" id="action" name="action" value="addtoCart">
                                        <div class="input_back">
                                            <i class="fa-solid fa-check"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pproduct_data_content">
                                <div class="pproduct_data_des">
                                    <a href="/Shop/Detail/${value.productID}" class="pproduct_data_name">${value.productName}</a>
                                    <p class="pproduct_data_price">$${value.price}</p>
                                </div>
                            </div>
                        </div>

                `);
                });
//                reloadScript('/js/DangScript/Home.js');
            }
        });
    }
//    function reloadScript(scriptName) {
//        // First, remove the old script
//        $('script[src$="' + scriptName + '"]').remove();
//
//        // Then, append a new script element with the same source
//        var newScript = document.createElement('script');
//        newScript.type = 'text/javascript';
//        newScript.src = scriptName;
//        $('body').append(newScript);
//    }

    load_more_data(limit, start);
    $('#btn-load-more').click(function () {
        start = start + limit;
        load_more_data(limit, start);
    });

});


