class Comment < ActiveRecord::Base
  belongs_to :design, inverse_of: :comments
  belongs_to :user

  validates_presence_of :body

end
