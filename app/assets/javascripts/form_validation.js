(function() {

    var fv = {
        register: register,
        validate: validate
    };

    function register(frm) {
        $(frm + ' input, textarea').each(function() {
            if ($(this).data("fv")) {
                $(this).on("blur", function() {
                    if (!verify($(this))) {
                        display($(this));
                    }
                });
            }
        });
    }

    function verify(obj) {
        var value = (obj.val()).trim();
        var type = (obj.data("fv_type")).trim();
        switch (type) {
            case "text":
                return value.length !== 0;
            case "email":
                var efilter = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return efilter.test(value);
            case "password":
                var filter = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d#?!@$%^&*-]{8,32}$/;
                return filter.test(value);
            case "password_confirmation":
                var pass_fields = $(":password");
                var p1 = pass_fields[0].value.trim();
                var p2 = pass_fields[1].value.trim();
                return (p1 !== "") && (p1 === p2);
            case "select":
                return obj.val() !== "";
        }
    }

    function display(obj) {
        var msg = "";
        msg = obj.data("fv_err_msg");
        if (msg.length > 0)
            toastr.error(msg);
    }

    function validate(frm) {
        var flag = true;
        $(frm).find(':input').each(function() {
            var ele = $(this);
            if (ele.data("fv")) {
                var result = verify(ele);
                if (!result) {
                    display(ele);
                    flag = false;
                }
            }
        });
        return flag;
    }

    window.fv = fv;
})(window);
