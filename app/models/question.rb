class Question < ActiveRecord::Base
  has_many :candidates
  has_many :comments
  belongs_to :user
  validates :name, presence: true
end
