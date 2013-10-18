class Design < ActiveRecord::Base
  validates_presence_of :description
  validates_presence_of :title

  belongs_to :user

  has_many :comments,
    inverse_of: :design

  mount_uploader :image, ImageUploader
end
