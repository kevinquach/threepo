function handleFileSelect(evt) {

    // Removes image preview if one already exists
    $('#image_preview img').remove();

    var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
            $('#image_preview').append('<img src="' + e.target.result + '" class="thumbnail"/>')

        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  document.getElementById('image').addEventListener('change', handleFileSelect, false);
