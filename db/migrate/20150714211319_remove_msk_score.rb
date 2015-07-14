class RemoveMskScore < ActiveRecord::Migration
  def change
    remove_column :candidates, :marry_score
    remove_column :candidates, :screw_score
    remove_column :candidates, :kill_score

  end
end
