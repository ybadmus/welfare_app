class CreateContributor < ActiveRecord::Migration[6.1]
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :phonenumber
      t.string :contributor_no

      t.timestamps
    end
  end
end
