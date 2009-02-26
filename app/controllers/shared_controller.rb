class SharedController < ApplicationController
  
  # GET /shared/pubslug
  # GET /shared/pubslug.xml
  def show
    @asset = Asset.find(:first, :conditions => {:pubslug => params[:id]})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asset }
    end
  end

end
