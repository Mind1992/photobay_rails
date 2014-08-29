class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => {
    medium: '300x300>',
    small: '140x140>',
    thumb: '64x64!'
  }

validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
