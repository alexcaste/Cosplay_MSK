class RemoveImageLinkFromUsers < ActiveRecord::Migration
  def change
    remove_column :candidates, :image_path
  end
end
