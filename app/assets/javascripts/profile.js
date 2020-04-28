$(document).on('turbolinks:load', function () {
  // 新規作成・編集画面で、file_fieldに選択した画像をプレビューで確認できるようにする
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#header_image_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL2(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#user_icon_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#header_image').change(function () {
    readURL(this);
  });

  $('#user_icon').change(function () {
    readURL2(this);
  });
});
