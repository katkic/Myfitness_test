$(document).on('turbolinks:load', function () {
  // 新規作成・編集画面で、file_fieldに選択した画像をプレビューで確認できるようにする
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#post_picture_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#post_picture').change(function () {
    readURL(this);
  });
});
