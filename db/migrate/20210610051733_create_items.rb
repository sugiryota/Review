class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,        null:false
      t.text        :text        
      t.integer     :category_id, null:false
      t.string      :audio,       null:false
      t.string      :url
      t.references  :user,        null:false, foreign_key: true
      t.timestamps
    end
  end
end
