function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(document).ready(function () {
    $("a[href~='" + location.pathname.split("/")[2] + "']").parent().addClass("active");

    $(".chkTile input").change(function () {
        var chk = $(this);
        if (chk.prop("checked")) {
            chk.parent().parent().removeClass("btn-default");
            chk.parent().parent().addClass("btn-info");
        }
        else {
            chk.parent().parent().removeClass("btn-info");
            chk.parent().parent().addClass("btn-default");
        }
    });

});

function formLoad(sender, args) {
    alert("laoded");
}

function ValidateNumeric(event) {
    if (!((event.keyCode > 47 && event.keyCode < 58)
        || (event.keyCode > 95 && event.keyCode < 106)
        || event.keyCode == 110
        || event.keyCode == 190
        || event.keyCode == 8)) {
        return false;
    }
}

