/* global $ */
//////////// left_nav ////////////
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
    $.cookie('menu', $(this).next('.sub-menu-body').attr('id'), {expires: 1 });
    $('.sub-menu-body').not($(this).next('.sub-menu-body')).slideUp();
  })
});
//////////// tag_edit ////////////
$(function(){
    $('.tag-edit').on('click', function(){
    $(this).parents('.tag-flag').next('.tag-edit-form').slideToggle();
    $('.tag-edit-form').not($(this).parents('.tag-flag').next('.tag-edit-form')).slideUp(); 
    })
});
//////////// list_edit ////////////
$(function(){
    $('.list-edit').on('click', function(){
    $(this).parents('.list-flag').next('.list-edit-form').slideToggle();
    $('.list-edit-form').not($(this).parents('.list-flag').next('.list-edit-form')).slideUp(); 
    })
});
//////////// tng_edit ////////////
$(function(){
    $('.tng-edit').on('click', function(){
    $(this).parents('.tng-main').nextAll('.tng-edit-form').slideToggle();
    $('.tng-edit-form').not($(this).parents('.tng-main').nextAll('.tng-edit-form')).slideUp(); 
    })
});
//////////// all_search ////////////
$(function(){
  $('.search-form').hide();
  $('.search-btn').on('click',function(){
      if($('.search-form').css('display')!='none'){  //表示されてる状態のとき
        //スライドアップ　表示されている時の長さがでてくる
        $('.search-tngs').css('height', '79vh' );
        $('.search-form').slideToggle();
      }else {
        //スライドダウン　表示されてない時の長さがでてくる　formが隠れてるとき
          $('.search-tngs').css('height', $('.search-tngs').outerHeight() - $('.search-form').outerHeight() -2 +'px' );
          $('.search-form').slideToggle();
      }
  });
});
/////自作jsを一番上にやるといろいろとヤバイ