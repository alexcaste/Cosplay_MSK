class Candidate < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :name,  presence: true
  validates :image_path, presence: true
end
