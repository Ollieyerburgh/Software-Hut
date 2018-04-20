$( document ).ready(function() {
    $("#example_id").ionRangeSlider();
    $(".slickaroo").slick({
        dots: false,
        accessibility: false,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 4000,
        fade: true

    });
    $('#helloworld').submit(function(ev) {
        ev.preventDefault(); // to stop the form from submitting
        /* Validations go here */
        var e = document.getElementById("selectsubject");
        var subject = e.options[e.selectedIndex].value;
        document.getElementById("subject").value = subject;
        this.submit(); // If all the validations succeeded
    });
});


