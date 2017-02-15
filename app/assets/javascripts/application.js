//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function(){

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
