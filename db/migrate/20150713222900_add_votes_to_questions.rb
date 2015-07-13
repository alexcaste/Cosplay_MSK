class AddVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_0, :int
    add_column :questions, :vote_1, :int
    add_column :questions, :vote_2, :int
  end
end
