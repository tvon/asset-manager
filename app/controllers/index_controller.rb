class IndexController < ApplicationController
  
  # GET /index
  # GET /index.xml
  def index
    @public = Asset.find(:all, :conditions => {:public => true})
    @private = Asset.find(:all, :conditions => {:public => false})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end
  
end
