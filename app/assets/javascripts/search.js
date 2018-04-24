$( document ).ready(function() {
    $("#example_id").ionRangeSlider();
    $(".slickaroo").slick({
        dots: false,
        accessibility: false,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 3000,
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 1,

    });

    $('#helloworld').submit(function(ev) {
        ev.preventDefault(); // to stop the form from submitting
        /* Validations go here */
        var slider = $("#example_id").data("ionRangeSlider");
        var distance_value = slider.result.from;
        document.getElementById("distance").value = distance_value;

        var postcode = document.getElementById("postcode_value").value;
        document.getElementById("postcode").value = postcode;

        //var e = document.getElementById("selectsubject");
        //var subject = e.options[e.selectedIndex].value;
        //document.getElementById("subject").value = subject;
        this.submit(); // If all the validations succeeded
    });
});


