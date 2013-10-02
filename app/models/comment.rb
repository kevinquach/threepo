class Comment < ActiveRecord::Base
  belongs_to :design,
    inverse_of: :comments
end
