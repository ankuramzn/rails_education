$(document).ready(function() {


    // Uploadify reference : http://railstips.org/blog/archives/2009/07/21/uploadify-and-rails23/
    $('#document_file_upload').uploadify({
    // Its possible that you would want to delay till later which field you would like to uploadify
    // If thats the case when the page loads up, it can set the java script variables like :
    //        var uploaderID = 'document_file_upload';
    //        var fileFieldID = 'document_file_name';
    // and the js code can be ready with placeholders
    // Reference : http://webdeveloperpost.com/Articles/Ways-to-fire-jQuery-and-javascript-code-when-the-page-loads.aspx
    // $("#"+uploaderID).uploadify({
      'uploader'  : '/images/uploadify.swf',
      'script'    : '/documents/file_uploads', // the remote function that is being called in the controller
      'cancelImg' : '/images/cancel.png',
      'folder'    : '/images',
      'auto'      : true,
      //'scriptData' : { 'what': 'fubar', 'who': 'some things' },
      //'scriptData' : { 'what': $('#document_file_name').val()},  


     'onComplete': function(event, queueID, fileObj, response, data){
    //      The various return values you can get from the remote function that was called
    //       alert("completed uploading file: "+fileObj['name'] + " and response was " + response);

    //      Another funky way of lcoating the elements you wish to update with the response value 
    //       var parentId = $("#"+uploaderID).parent().attr("id");
    //       $("#"+parentId).find('#'+fileFieldID).val(response);
           $('#document_file_name').val(response);
     }
    });

    // Sending Data when uploading files
    // http://www.uploadify.com/forums/discussion/24/fileuploadsettings-problem/p1
    // http://www.uploadify.com/forums/discussion/1538/how-to-pass-values-to-uploadifyupload.php/p1
    
    $('#document_name').change(function(){
        $('#document_file_upload').uploadifySettings('scriptData', { x : 1, y : $('#document_name').val() } );
    });    

})
