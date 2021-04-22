class AddRemarksToWelfares < ActiveRecord::Migration[6.1]
  def change
    add_column :welfares, :remark, :string
  end
end
