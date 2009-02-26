class Asset < ActiveRecord::Base
  belongs_to :user
  has_one :attachment, :dependent => :destroy
  stampable
  
  def identifier
    long = params[:link]['url']
    short = Digest::MD5.hexdigest(long)
  end
end
