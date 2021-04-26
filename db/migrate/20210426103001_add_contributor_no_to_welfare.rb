class AddContributorNoToWelfare < ActiveRecord::Migration[6.1]
  def change
    add_column :welfares, :contributor_no, :string
  end
end
