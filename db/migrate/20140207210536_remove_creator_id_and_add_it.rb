class RemoveCreatorIdAndAddIt < ActiveRecord::Migration
  def change
    remove_column :secret_taggings, :creator_id
    add_column :tags, :creator_id, :integer
    add_index :tags, :creator_id
  end
end
