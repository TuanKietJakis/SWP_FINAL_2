$(document).ready(function () {
    filterData($('#regex').val(), "search");
    resetBtn();
    $("[id^='c']").each(function () {
        $(this).on('change', function () {
            if ($(this).is(':checked')) {
                if ($('.filter_item_chip').html !== null) {
                    removeTag($(this).data("name"));
                }
                filterData($(this).data("name"), $(this).data("name"));
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
                filterData($(this).data("name"), $(this).data("name"));
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
                filterData($(this).data("name"), "price");
                resetBtn();
            }
        });
    });
    function filterData(tag, type) {
        $('.filter_list_chip').append(`
                            <div class="filter_item_chip" data-remove="${type}">
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
    function resetBtn(){
        $('.filter_item_chip').each(function () {
            $(this).on('click', function () {
                $(this).remove();
            });
        });
    }
    
    function filter_data(){
        var action = "fetch_data";
        var brand = get_filter('brand');
    }
});


