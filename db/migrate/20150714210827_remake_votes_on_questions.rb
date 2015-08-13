class RemakeVotesOnQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :vote_0
    remove_column :questions, :vote_1
    remove_column :questions, :vote_2

    add_column :questions, :vote_0, :int, :default => 0
    add_column :questions, :vote_1, :int, :default => 0
    add_column :questions, :vote_2, :int, :default => 0

  end
end
