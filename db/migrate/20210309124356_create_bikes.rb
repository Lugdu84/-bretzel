class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.text :description
      t.integer :price
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
