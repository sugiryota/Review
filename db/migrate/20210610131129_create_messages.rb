class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :comment
      t.string :audiocomment
      t.references :user,     null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
