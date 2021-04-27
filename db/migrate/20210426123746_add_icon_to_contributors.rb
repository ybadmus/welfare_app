class AddIconToContributors < ActiveRecord::Migration[6.1]
  def change
    add_column :contributors, :icon, :string
  end
end
