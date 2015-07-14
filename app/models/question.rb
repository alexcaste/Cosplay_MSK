class Question < ActiveRecord::Base
  has_and_belongs_to_many :candidates
  has_many :comments
  belongs_to :user

  def vote_check (vote_0, vote_1, vote_2)
    if vote_0 == nil || vote_1 == nil || vote_2 == nil
      return 0
    elsif vote_0 == vote_1 || vote_1 == vote_2 || vote_0 == vote_2
      return 1
    else

    end
  end

  def count_vote (vote, candidate)
    if vote == "0"
      candidate.update(marry_score: candidate.marry_score + 1)
    elsif vote == "1"
      candidate.update(screw_score: candidate.screw_score + 1)
    else
      candidate.update(kill_score: candidate.kill_score + 1)
    end
  end

end
