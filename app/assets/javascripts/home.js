$(document).ready(function() {
  // Cover_image
  $(document).on("click","#cover_image_upload",function(){
    $("#imgupload").trigger("click");
    console.log($("#imgupload"));
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(this).attr('src', e.target.result);
        console.log(e.target.result);
        return e.target.result;
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('change',"#imgupload",function(e){
    var imgupload1 = readURL(this);
    $("#my_image").css("background", 'url(' + imgupload1 + ')');
    $("#upload_form").submit(); 
    location.reload();
  });

  //@@@@@@@@@@@@@@@@@@@@@@@@@@@@ public image @@@@@@@@@@@@@@@@@@@
  // public_image
  $(document).on("click","#profileupload_pic",function(){
      console.log($("#public_imgupload"));
    $("#public_imgupload").trigger("click");
  });

  $(document).on('change',"#public_imgupload",function(e){
    $("#profileupload_form").submit();  
    $("#my_image1").attr("src","0.name");
    location.reload();
    location.reload();

  });

  //@@@@@@@@@@@@@@@@@@@@@@ career_edit_button_click_evnet@@@@@@@@@@@@@@@@
  $(document).on("click","#career_edit_button",function(e){
    // var edit_form = $("#career_form").data('id')
    var  edit_form = $(this).data("id");
    console.log($(this).data("id"));  
    $.get("/careers/career_edit/"+edit_form).done(function(res){
      $("#edit_form_update").html(res)
       //window.location = '/home/edit_profile';
    }).fail(function(){
      alert("failed");
    });
  });
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Sponsor Edit form click  events@@@@@@@@@@@@@@//
  $(document).on("click","#sponsors_edit_button",function(e){
    var  edit_form = $(this).data("id");
    console.log($(this).data("id"));  

    $.get("/sponsors/sponsor_edit/"+edit_form).done(function(res){
      $("#sponsor_edit_form").html(res)
      
    }).fail(function(){
      alert("failed");
    });
  });
});

// Sub header men
$(document).ready(function(){ 
  var touch   = $('#resp-menu');
  var menu  = $('.menu'); 
    $(touch).on('click', function(e) {
      e.preventDefault();
      menu.slideToggle();
    });
    
    $(window).resize(function(){
      var w = $(window).width();
      if(w > 767 && menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    });
});

  



