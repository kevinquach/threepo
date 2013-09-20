class Design < ActiveRecord::Base
  validates_presence_of :description
  validates_presence_of :title
  belongs_to :user
end
