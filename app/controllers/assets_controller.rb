class AssetsController < ApplicationController
  
  before_filter :login_required
  
  layout 'application'
  
  # GET /assets
  # GET /assets.xml
  def index
    @assets = Asset.find(:all)
    @public = Asset.find(:all, :conditions => {:public => true})
    @private = Asset.find(:all, :conditions => {:public => false})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = Asset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asset }
    end
  end
  
  # GET /assets/new
  # GET /assets/new.xml
  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.xml
  def create
    
    identifier = Digest::MD5.hexdigest("#{params[:attachment_file].original_filename} #{params[:description]} #{Time.now.to_f}")
    params[:asset][:pubslug] = identifier

    @asset = Asset.new(params[:asset])
    @attachment = Attachment.new(:uploaded_data => params[:attachment_file])

    @service = AssetService.new(@asset, @attachment)

    respond_to do |format|
      if @service.save          
        flash[:notice] = 'Asset was successfully created.'
        format.html { redirect_to(@asset) }
        format.xml  { render :xml => @asset, :status => :created, :location => @asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.xml
  def update
    @asset = Asset.find(params[:id])
    @attachment = @asset.attachment
    
    @service = AssetService.new(@asset, @attachment)

    respond_to do |format|
      if @service.update_attributes(params[:asset], params[:attachment_file])
        flash[:notice] = 'Asset was successfully updated.'
        format.html { redirect_to(@asset) }
        format.xml  { head :ok }
      else
        @attachment = @service.attachment
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.xml
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to(assets_url) }
      format.xml  { head :ok }
    end
  end
end
