class RemoveVote0FromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :vote_0

  end
end
