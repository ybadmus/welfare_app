class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :group_id
      t.integer :welfare_id

      t.timestamps
    end
  end
end
