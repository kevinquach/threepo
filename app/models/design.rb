class Design < ActiveRecord::Base
  validates_presence_of :description
  validates_presence_of :title

  belongs_to :user, inverse_of: :designs, dependent: :destroy

  has_many :comments, inverse_of: :design

  mount_uploader :image, ImageUploader
  mount_uploader :file, FileUploader
end
