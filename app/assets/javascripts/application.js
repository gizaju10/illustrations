//= require jquery3
//= require popper
//= require bootstrap-sprockets
// require jquery
// require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require activestorage
//= require jquery.jscroll.min.js

// 無限スクロール
$(document).on('turbolinks:load', function () {
  $('.jscroll').jscroll({
    contentSelector: '.skill-list',
    nextSelector: 'span.next:last a',
    loadingHtml: '<i class="fas fa-sync-alt fa-lg fa-spin"></i>'
  });
});

// 右下上へボタン
$(document).on('turbolinks:load', function () {
  var appear = false;
  var pagetop = $('#page_top');
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {  //100pxスクロールしたら
      if (appear == false) {
        appear = true;
        pagetop.stop().animate({
          'right': '5px' //右から5pxの位置に
        }, 300); //0.3秒かけて現れる
      }
    } else {
      if (appear) {
        appear = false;
        pagetop.stop().animate({
          'right': '-50px' //右から-50pxの位置に
        }, 300); //0.3秒かけて隠れる
      }
    }
  });
  pagetop.click(function () {
    $('body, html').animate({ scrollTop: 0 }, 300); //0.3秒かけてトップへ戻る
    return false;
  });
});