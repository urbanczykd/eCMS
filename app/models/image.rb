class Image < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :photo, :styles => { :vsmall => "150x150>",
                                         :small => "300x300>",
                                         :oryginal => "1280x1024>"},
                  :url  => "/gallery/image/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/gallery/image/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
