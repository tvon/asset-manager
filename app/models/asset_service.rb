class AssetService
  
  attr_reader :asset, :attachment
  
  def initialize(asset, attachment)
    @asset = asset
    @attachment = attachment
  end
  
  def save
    return false unless valid?
#    @user = User.find(request.session[:user_id])
 #   @asset.user = 
    begin
      Asset.transaction do
        if @attachment.new_record?
          @asset.attachment.destory if @asset.attachment
          @attachment.asset = @asset
          @attachment.save!
        end
        @asset.save!
        true
      end
    rescue
      false
    end
  end
  
  def update_attributes(asset_attributes, attachment_file) 
    @asset.attributes = asset_attributes 
    unless attachment_file.blank? 
      @attachment = Attachment.new(:uploaded_data => attachment_file) 
    end 
    save 
  end 
  
  def valid?
    @asset.valid? && @attachment.valid?
  end
end