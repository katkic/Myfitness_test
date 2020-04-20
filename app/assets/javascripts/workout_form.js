$(document).on('turbolinks:load', function () {
  // ページ表示時にset数を表示する
  $('.exercise-logs-area').children('div.fields:visible').each(function (index) {
    $(this).find('.exercise-set').text($('.exercise-logs-area').children('div.fields:visible').index(this) + 1 + ' set');
    $(this).find('.exercise-set-hidden').val($('.exercise-logs-area').children('div.fields:visible').index(this) + 1);
  });

  // 動的に追加されたフォームにset数を表示
  function setFieldNum() {
    $('.exercise-logs-area').children('.fields:visible').each(function (index) {
      $(this).find('.exercise-set').text($('.exercise-logs-area').children('.fields:visible').index(this) + 1 + ' set')
      $(this).find('.exercise-set-hidden').val($('.exercise-logs-area').children('.fields:visible').index(this) + 1);
    });
  }

  // 動的に表示するフォームの数を制限
  // 制限数は、f.link_to_add メソッドに data: { limit: 10 }で指定
  $(document).on('nested:fieldAdded', function (e) {
    setFieldNum();
    var link = $(e.currentTarget.activeElement);
    if (!link.data('limit')) {
      return;
    }
    if ($('.exercise-logs-area').children('.fields:visible').length >= link.data('limit')) {
      link.hide();
    }
  });

  $(document).on('nested:fieldRemoved', function (e) {
    setFieldNum();
    var link = $(e.target).siblings('a.add_nested_fields');
    if (!link.data('limit')) {
      return;
    }
    if ($('.exercise-logs-area').children('.fields:visible').length < link.data('limit')) {
      link.show();
    }
  });
})
