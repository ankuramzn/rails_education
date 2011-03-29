class HazmatController < ApplicationController
  def asin_file_input
  end

  def asin_file_upload
    puts "asin_file_upload called"


    puts "asin_file_upload Params" + params.inspect
    # target directory to save files
    directory = "public/images/"
    # create the file path
    path = File.join(directory, params[:Filename].to_s)
    new_name = 'Uploaded ' + params[:Filename].to_s
    # write the file
    File.open(path, "wb") { |f| f.write(params[:Filedata].read) }
    respond_to do |format|
      format.html { render :text => new_name, :layout => false }
    end


  end

  def asin_file_process
  end

    def ajax_json_response
    val = Hash.new
    val['output_value'] = "JSON Response : " + params['input_value']
    respond_to do |format|
      format.json { render :json => val.as_json }
    end
  end

end
