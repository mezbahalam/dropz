$(document).ready ->
  Dropzone.options.imageUploadForm = {
    paramName: "job_image[photo]",
    acceptedFiles: 'image/*',
    maxFiles: 6,
    maxFilesize: 2,
    addRemoveLinks: true
   
  }
  