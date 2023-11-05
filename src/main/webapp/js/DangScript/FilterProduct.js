$(document).ready(function () {
    filter_data();
    filterData($('#regex').val(), "search");
    resetBtn();
    $("[data-remove='" + "search" + "']").click(function(){
       $('#regex').val("");
       filter_data();
    });
    $("[id^='c']").each(function () {
        $(this).on('change', function () {
            if ($(this).is(':checked')) {
                if ($('.filter_item_chip').html !== null) {
                    removeTag($(this).data("name"));
                }
                filterData($(this).data("name"), $(this).data("name"),$(this).attr("id"));
                resetBtn();
            }
        });
    });
    $("[id^='b']").each(function () {
        $(this).on('change', function () {
            if ($(this).is(':checked')) {
                if ($('.filter_item_chip').html !== null) {
                    removeTag($(this).data("name"));
                }
                filterData($(this).data("name"), $(this).data("name"),$(this).attr("id"));
                resetBtn();
            }
        });
    });
    $("[id^='price']").each(function () {
        $(this).on('change', function () {
            if ($(this).is(':checked')) {
                if ($('.filter_item_chip').html !== null) {
                    removeTag("price");
                }
                filterData($(this).data("name"), "price",$(this).attr("id"));
                resetBtn();
            }
        });
    });
    function filterData(tag, type,id) {
        $('.filter_list_chip').append(`
                            <div class="filter_item_chip" data-remove="${type}" data-id="${id}">
                                <span class="filter_item_chip_name">
                                    ${tag}
                                </span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>
    `);
    }
    function removeTag(type) {
        $("[data-remove='" + type + "']").remove();
    }
    function resetBtn() {
        $('.filter_item_chip').each(function () {
            $(this).on('click', function () {
                $("[id^='"+$(this).data("id")+"']").prop("checked", false);
                console.log($("[id^='"+$(this).data("id")+"']"));
                $(this).remove();
                filter_data();
            });
        });
    }

    function filter_data() {
        const UserID = $('#UserID').val();
        var action = "fetch_data";
        var search = $('#regex').val();
        var price = 0;
        if ($('#price-lowtohigh').is(':checked')) {
            price = 1;
        } else if ($('#price-hightolow').is(':checked')) {
            price = 2;
        }
        var brand = get_filter('brand');
        var category = get_filter('category');
        console.log(brand);
        console.log(category);
        $.ajax({
            url: "/Shop",
            method: "POST",
            data: {
                action: action,
                search: search,
                price: price,
                brand: brand,
                category: category
            },
            success: function (data) {
                console.log(data.length);
                if (data.length > 0) {
                    $('.pproduct_content').empty();
                    $('.pproduct_title').html("");
                    $('.pproduct_title').html("Search Result for "+ search +"...");
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
                } else {
                    $('.pproduct_content').empty();
                    $('.pproduct_title').html("");
                    $('.pproduct_title').html("We got no result for you");
                }
            }});
    }
    function get_filter(class_name) {
        var filter = "";
        $('.' + class_name + ':checked').each(function () {
            filter += $(this).val() + ",";
        });
        return filter.substring(0, filter.length - 1);
    }

    $('.classfilter').click(function () {
        filter_data();
    });
});


