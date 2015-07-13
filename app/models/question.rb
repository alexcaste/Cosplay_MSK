class Question < ActiveRecord::Base
  has_many :candidates
  has_many :comments
  belongs_to :user

  def count_vote (vote, candidate)
    if vote == "0"
      candidate.update(marry_score: candidate.marry_score + 1)
    elsif vote == "1"
      candidate.update(screw_score: candidate.screw_score + 1)
    else
      candidate.update(kill_score: candidate.kill_score + 1)
    end
    binding.pry
  end

end
