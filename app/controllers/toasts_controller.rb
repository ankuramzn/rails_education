class ToastsController < ApplicationController
  # GET /toasts
  # GET /toasts.xml
  def index
    @toasts = Toast.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @toasts }
    end
  end

  # GET /toasts/1
  # GET /toasts/1.xml
  def show
    @toast = Toast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @toast }
    end
  end

  # GET /toasts/new
  # GET /toasts/new.xml
  def new
    @toast = Toast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @toast }
    end
  end

  # GET /toasts/1/edit
  def edit
    @toast = Toast.find(params[:id])
  end

  # POST /toasts
  # POST /toasts.xml
  def create
    @toast = Toast.new
    @toast.bread = params[:toast][:bread]

    puts "Original File Name " +  params[:toast][:photo].original_filename.to_s

    # target directory to save files
    directory = "public/images/"

    # create the file path
    path = File.join(directory, params[:toast][:photo].original_filename.to_s)

    # write the file
    File.open(path, "wb") { |f| f.write(params[:toast][:photo].read) }

    if @toast.save
      flash.now[:notice] = 'Toast was successfully created.'      
    end

    respond_to do |format|
      format.js { render :template => "toasts/create.js.erb", :locals => { :file_name => params[:toast][:photo].original_filename.to_s } }      
    end
  end

  # PUT /toasts/1
  # PUT /toasts/1.xml
  def update
    @toast = Toast.find(params[:id])

    respond_to do |format|
      if @toast.update_attributes(params[:toast])
        flash[:notice] = 'Toast was successfully updated.'
        format.html { redirect_to(@toast) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @toast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toasts/1
  # DELETE /toasts/1.xml
  def destroy
    @toast = Toast.find(params[:id])
    @toast.destroy

    respond_to do |format|
      format.html { redirect_to(toasts_url) }
      format.xml  { head :ok }
    end
  end


  def ajax_json_response
    val = Hash.new
    val['output_value'] = "JSON Response : " + params['input_value']
    respond_to do |format|
      format.json { render :json => val.as_json }      
    end
  end

  def ajax_js_response
    @output_value = "JS Response : " + params['input_value']
    respond_to do |format|
      format.js { render :template => "toasts/ajax_js_response.js.erb", :locals => { :output_value => @output_value} }     
    end
  end

  def ajax_html_response
    @output_value = "HTML Response " + params['input_value']
    respond_to do |format|      
      format.html { render :template => 'toasts/ajax_html_response.html.erb', :locals => { :output_value => @output_value }, :layout => false }
    end
  end
  
end
