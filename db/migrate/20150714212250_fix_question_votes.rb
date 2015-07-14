class FixQuestionVotes < ActiveRecord::Migration
  def change
    add_column :questions, :vote_0, :integer, :default => 0
    remove_column :questions, :vote_2, :integer

  end
end
