/* global $ */
//////////// left_nav ////////////
$(document).ready(function(){
  $(function(){
    $('.sub-menu-body').hide();
    //くっきの保存がされていたらそれをひらく
    for (var i = 1; i<= 4;i++){
      if($.cookie('menu') == 'menu'+i ){
        $('#menu'+ i ).show();
      }
    }
    $('.sub-menu-head').on('click', function(){
      $(this).next('.sub-menu-body').slideToggle();
      //くっきの設定  idの取得 
      var date = new Date();
      date.setTime( date.getTime() + ( 30 * 60 * 1000 ));
      $.cookie('menu', $(this).next('.sub-menu-body').attr('id'), {expires: date });
      $('.sub-menu-body').not($(this).next('.sub-menu-body')).slideUp();
    });
  });
  //////////// tag_edit ////////////
  $(function(){
      $('.tag-edit').on('click', function(){
      $(this).parents('.tag-flag').next('.tag-edit-form').slideToggle();
      $('.tag-edit-form').not($(this).parents('.tag-flag').next('.tag-edit-form')).slideUp(); 
      });
  });
  //////////// list_edit ////////////
  $(function(){
      $('.list-edit').on('click', function(){
      $(this).parents('.list-flag').next('.list-edit-form').slideToggle();
      $('.list-edit-form').not($(this).parents('.list-flag').next('.list-edit-form')).slideUp(); 
      });
  });
  //////////// tng_edit ////////////
  $(function(){
      $('.tng-edit').on('click', function(){
      $(this).parents('.tng-main').nextAll('.tng-edit-form').slideToggle();
      $('.tng-edit-form').not($(this).parents('.tng-main').nextAll('.tng-edit-form')).slideUp(); 
      });
  });
  //////////// all_search ////////////
  $(function(){
    $('.search-form').hide();
    $('.search-btn').on('click',function(){
        if($('.search-form').css('display')!='none'){  //display == block
          $('.search-tngs').css('height', '79vh' );
          $('.search-form').slideToggle();
        }else { //slide down
            $('.search-tngs').css('height', $('.search-tngs').outerHeight() - $('.search-form').outerHeight() -2 +'px' );
            $('.search-form').slideToggle();
        }
    });
  });
  setTimeout(function(){
  $('.load-flag').fadeOut();
  $('.main-flag').fadeIn(800);    
  },2000);
  
  
  //////////////////////////////////smart_phone/////////////////////////////////
  
  //////////// list ////////////
  $('.list-p').hide();
  $('.list-down').on('click',function(){
    $(this).parents('.list-p-flag').nextAll('.list-p').slideToggle(650);
    $('.list-p').not($(this).parents('.list-p-flag').next('.list-p')).slideUp(650); 
  });
  
  //nav
  //$('.tng-form-p , .tag-form-p , .list-form-p , .user-form-p').hide();
  $('.form-p').hide();

  $('.btn-p').on('click',function(){
    for(var i=0;i<4;i++){
      if ($(this).hasClass('bp-'+i)){
        $('.fp-'+i).slideToggle(500);
        $('.form-p').not($('.fp-'+i)).slideUp(500);
      }
    }
  });
  
  

  
  
  
  
  
  
  
  
  
  
  
});
/////自作jsを一番上にやるといろいろとヤバイ