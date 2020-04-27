$(document).on('turbolinks:load', function () {
  // 新規作成・編集画面で、file_fieldに選択した画像をプレビューで確認できるようにする
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#body_pic1_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL2(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#body_pic2_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL3(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#body_pic3_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#body_picture1').change(function () {
    readURL(this);
  });

  $('#body_picture2').change(function () {
    readURL2(this);
  });

  $('#body_picture3').change(function () {
    readURL3(this);
  });
});
