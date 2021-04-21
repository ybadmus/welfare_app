class CreateWelfares < ActiveRecord::Migration[6.1]
  def change
    create_table :welfares do |t|
      t.integer :authorId
      t.string :name
      t.string :amount
      t.string :integer

      t.timestamps
    end
  end
end
