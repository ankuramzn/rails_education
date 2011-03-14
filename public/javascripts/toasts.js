// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

// LOTS OF GOODIES



$(document).ready(function() {

// SUBMITTING THE WHOLE FORM AJAXILY - USE AJAXFORM
    
    $('#new_toast').ajaxForm({
        dataType : 'script'
//        success : function() {
//                alert('Check This');
//                return false;
//                }
    });


// VARIOUS AJAX METHOD RESPONSES
    $('#json_response_field').change(function(){
        alert('Calling JSON reponse function');
        $.ajax({
            url         : 'ajax_json_response',
            type        : 'get',
            dataType    : 'json',
            data        : ({ input_value : $('#json_response_field').val() }),
            success     :  function(data){
                                alert(data['output_value']);
                            }
        })
    });

    $('#js_response_field').change(function(){
        alert('Calling JS response function');
        $.ajax({
            url         : 'ajax_js_response',
            type        : 'get',
            datatype    : 'script',
            data        : ({ input_value : $('#js_response_field').val() }),
            success     : function(data){
                             //alert(data);
                          }
        })
    });

    $('#html_response_field').change(function(){
        alert('Calling html response function');
        $.ajax({
            url         : 'ajax_html_response',
            type        : 'get',
            dataType    : 'html',
            data        : ({ input_value : $('#html_response_field').val() }),
            success     :   function(data){
                                alert('success');
                                $('#html_response_div').html(data);
                            },
           error        : function() { alert("error"); }
        })
    })

});

