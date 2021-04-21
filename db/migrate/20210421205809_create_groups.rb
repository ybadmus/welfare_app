class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
