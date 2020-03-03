$(document).ready(function () {

    $("body").delegate("#AddToCart", "click", function (event) {
        var pid = $(this).attr("data-id");
        event.preventDefault();
        $(".overlay").show();
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {AddToCart: pid},
            success: function (data) {
                count_item();
                getCartItem();
                $('#customer_msg').html(data);
                $('.overlay').hide();
            }
        });
    });

    $("body").delegate("#logout", "click", function (event) {
        $(".overlay").show();
        $.ajax({
            url: "logout.php",
            type: "post",
            data: {logout: 1},
            success: function () {
                location.reload(true);
            }
        });
    });

    count_item();
    function count_item() {
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {count_item: 1},
            success: function (data) {
                $(".badge").html(data);
            }
        });
    }


    getCartItem();
    function getCartItem() {
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {Common: 1, select_item: 1},
            success: function (data) {
                $("#cart_product").html(data);
            }
        });
    }

    function bangla_to_english(toSend)
    {
        var response;
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {b_to_e: toSend},
            async: false,
            success: function (data) {
                response = data;
            }
        });
        return response;
    }


    function english_to_bangla(toSend)
    {
        var response;
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {e_to_b: toSend},
            async: false,
            success: function (data) {
                response = data;
            }
        });
        return response;
    }

    $("body").delegate(".quantity", "keyup", function (event) {
        event.preventDefault();
        var row = $(this).parent().parent();
        var price = bangla_to_english(row.find('.price').val());
        var qty = row.find('.quantity').val();
        if (isNaN(qty)) {
            qty = 1;
        }
        ;
        if (qty < 1) {
            qty = 1;
        }
        ;
        var total = price * qty;
        row.find('.total').val(english_to_bangla(total));
        var net_total = 0;
        $('.total').each(function () {
            net_total += (bangla_to_english($(this).val()) - 0);
        })
        $('.net_total').html("মোট : " + english_to_bangla(net_total) + "টাকা");

    })



    $("body").delegate(".remove", "click", function (event) {
        var remove = $(this).parent().parent().parent();
        var remove_id = remove.find(".remove").attr("remove_id");
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {RemoveItemFromCart: 1, RemoveId: remove_id},
            success: function (data) {
                $("#customer_msg").html(data);
                count_item();
                getCartItem();
                checkOutDetails();
            }
        })
    })



    $("body").delegate(".update", "click", function (event) {
        var update = $(this).parent().parent().parent();
        var update_id = update.find(".update").attr("update_id");
        var qty = update.find(".quantity").val();
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {UpdateCartItem: 1, UpdateId: update_id, Quantity: qty},
            success: function (data) {
                $("#customer_msg").html(data);
                count_item();
                getCartItem();
                checkOutDetails();
            }
        })


    })

    checkOutDetails();
    net_total();

    function checkOutDetails() {
        $('.overlay').show();
        $.ajax({
            url: "action.php",
            method: "POST",
            data: {Common: 1, checkOutDetails: 1},
            success: function (data) {
                $('.overlay').hide();
                $("#cart_checkout").html(data);
                net_total();
            }
        });
    }


    function net_total() {
        var net_total = 0;
        $('.quantity').each(function () {
            var row = $(this).parent().parent();
            var price = bangla_to_english(row.find('.price').val());
            var total = price * $(this).val() - 0;
            row.find('.total').val(english_to_bangla(total));
        })
        $('.total').each(function () {
            net_total += (bangla_to_english($(this).val()) - 0);
        })
        $('.net_total').html("মোট : " + english_to_bangla(net_total) + "টাকা");
    }

    $("#login").on("submit", function (event) {
        event.preventDefault();
        $.ajax({
            url: "login.php",
            type: "post",
            data: $("#login").serialize(),
            success: function (feedback) {
                if (feedback === "LoginSuccess")
                {
                    location.reload(true);
                } else
                {
                    $(".overlay").show();
                    $("#e_msg").html(feedback);
                    $(".overlay").hide();
                }
            }

        });
    });

    $("body").delegate("#signup", "click", function (event) {
        $.ajax({
            url: "signup.php",
            type: "post",
            data: $("#RegistrationForm").serialize(),
            success: function (data) {
                if (data === "RegisterSuccess")
                {
                    window.location.href = "Cart.php";
                } else
                {
                    $(".overlay").show();
                    $("#signup_msg").html(data);
                    $(".overlay").hide();
                }
            }
        });
    });


    $("body").delegate("#bKash", "click", function (event) {
        $(".overlay").show();
        $.ajax({
            url: "action.php",
            type: "post",
            data: {pay: 1},
            success: function (data) {
                if (data === "success")
                {
                    window.location.href = "bKash.php";
                } else
                {
                    $("#customer_msg").html(data);
                    count_item();
                    getCartItem();
                    checkOutDetails();
                }
            }
        });
    });

    $("body").delegate("#Rocket", "click", function (event) {
        $(".overlay").show();
        $.ajax({
            url: "action.php",
            type: "post",
            data: {pay: 1},
            success: function (data) {
                if (data === "success")
                {
                    location.reload();
                } else
                {
                    $("#customer_msg").html(data);
                    count_item();
                    getCartItem();
                    checkOutDetails();
                }
            }
        });
    });


    $("body").delegate("#varify", "click", function (event) {
         event.preventDefault();
        var trx = $("#transaction").val();
        $.ajax({
            url: "action.php",
            type: "post",
            data: {id: trx},
            success: function (data) {
                if (data === "success") {
                    window.location.href = "OrderPage.php";
                } else
                {
                    $("#customer_msg").html(data);
                }
            }
        });
    });
});




















