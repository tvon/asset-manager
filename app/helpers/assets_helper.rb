module AssetsHelper
  
  def link_to_asset(asset, options={})
    raise "Invalid asset" unless asset
    url = url_for :controller => "shared", :action => "show", :id => asset.pubslug, :only_path => false
    content_tag('a', url, {:href => url}.merge(options))
  end
  
  def link_to_attachment(asset, options={})
    raise "Invalid asset" unless asset
    url = url_for :controller => asset.attachment.public_filename, :only_path => false
    content_tag('a', url, {:href => url}.merge(options))
  end
end
