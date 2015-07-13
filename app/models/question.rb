class Question < ActiveRecord::Base
  has_many :candidates
  belongs_to :user
end
