class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.integer :price,          null: false
      t.string :description,     null: false
      t.integer :status_id,      null: false
      t.integer :judgment_id,    null: false
      t.integer :cost_id,        null: false
      t.integer :days_id,        null: false
      t.integer :prefecture_id,  null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end