class CreateCandidate < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :image_path
      t.integer :marry_score, default: 0
      t.integer :screw_score, default: 0
      t.integer :kill_score, default: 0
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
