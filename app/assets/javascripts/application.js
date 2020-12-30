//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require activestorage
//= require jquery.jscroll.min.js

// $(document).ready(function() {
//     $("p").text("jQuery稼働テスト(稼働中です)");
//   });

$(function() {
  $('.jscroll').jscroll({
    contentSelector: '.skill-list',
    nextSelector: 'span.next:last a',
    loadingHtml: '読み込み中'
  });
});

// $(function() {
//   $('.p-faq-title').on('click')({
// 	$(this).toggleClass('active'),
//   $(this).next().slideToggle(),
//   });

// $('.p-faq-title').on('click', function(){
// 	$(this).toggleClass('active');
// 	$(this).next().slideToggle();
// });