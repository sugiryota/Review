class AddMinicategoryToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :minicategory, :string
  end
end
