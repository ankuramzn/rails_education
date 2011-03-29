function test_fn(response){
    alert('Upload Completed JScript function called');
    // Can update the DOM as well
    $('#asin_file_name').val(response);
}

$(document).ready(function() {

    // Uploadify reference : http://railstips.org/blog/archives/2009/07/21/uploadify-and-rails23/
    $('#asin_file_upload').uploadify({
    // Its possible that you would want to delay till later which field you would like to uploadify
    // If thats the case when the page loads up, it can set the java script variables like :
    //        var uploaderID = 'document_file_upload';
    //        var fileFieldID = 'document_file_name';
    // and the js code can be ready with placeholders
    // Reference : http://webdeveloperpost.com/Articles/Ways-to-fire-jQuery-and-javascript-code-when-the-page-loads.aspx
    // $("#"+uploaderID).uploadify({
      'uploader'  : '/images/uploadify.swf',
      'script'    : '/hazmat/asin_file_upload', // the remote function that is being called in the controller
      'cancelImg' : '/images/cancel.png',
      'folder'    : '/images',
      'auto'      : true,
      //'scriptData' : { 'what': 'fubar', 'who': 'some things' },
      //'scriptData' : { 'what': $('#document_file_name').val()},


    'onComplete': function(event, queueID, fileObj, response, data){
        //The various return values you can get from the remote function that was called
        alert("completed uploading file: "+fileObj['name'] + " and response was " + response);

        // On completion of the upload we can call a JScript function as follows
        test_fn(response);

        alert('JavaScript function call over');

        // We can trigger an event
        $(document).trigger('FILE_UPLOADED');

           
        alert('Triggered Event processsing call over');

        $.ajax({
            url         : 'ajax_json_response',
            type        : 'get',
            dataType    : 'json',
            data        : ({ input_value : response }),
            success     :  function(data){
                                alert('Ajax Call Succeeded' + data['output_value']);
                            }
        });




    //      Another funky way of lcoating the elements you wish to update with the response value
    //       var parentId = $("#"+uploaderID).parent().attr("id");
    //       $("#"+parentId).find('#'+fileFieldID).val(response);
    //       $('#document_file_name').val(response);
        
     }
    });

    // http://www.michaelhamrah.com/blog/2008/12/event-pooling-with-jquery-using-bind-and-trigger-managing-complex-javascript/
    $(document).bind('FILE_UPLOADED', function(response) {
        alert('File Uploaded ' +  response);
    });


});