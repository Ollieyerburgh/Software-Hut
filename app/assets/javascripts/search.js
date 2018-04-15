$( document ).ready(function() {
    $('#helloworld').submit(function(ev) {
        ev.preventDefault(); // to stop the form from submitting
        /* Validations go here */
        var e = document.getElementById("selectsubject");
        var subject = e.options[e.selectedIndex].value;
        alert(subject);
        document.getElementById("subject").value = subject;
        this.submit(); // If all the validations succeeded
    });
});

