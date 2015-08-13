class AddCandidatesToQUestions < ActiveRecord::Migration
  def change
    add_column :questions, :candidate_1, :string
    add_column :questions, :candidate_2, :string
  end
end
