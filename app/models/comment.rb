class Comment < ActiveRecord::Base
  belongs_to :design, inverse_of: :comments
  belongs_to :user, inverse_of: :comments

  validates_presence_of :body

end
