//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
    // javascript for the show view
    $(".showmyform").click(function(){
        $(".description_offer").toggleClass("hidden");
    });

    $(".showmyformprice").click(function(){
        $(".price_offer").toggleClass("hidden");
    });

    $(".showmyformaddress").click(function(){
        $(".address_offer").toggleClass("hidden");
    });

    $(".showmyformcategory").click(function(){
        $(".category_offer").toggleClass("hidden");
    });

});

