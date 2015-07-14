class AddVotesToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :votes, :integer, :default => 0
  end
end
