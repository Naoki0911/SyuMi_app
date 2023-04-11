class CreateSakes < ActiveRecord::Migration[6.1]
  def change
    create_table :sakes do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :place, null: false
      t.integer :sweetness, null: false
      t.integer :flavor, null: false
      t.integer :sour, null: false
      t.integer :feeling, null: false
      t.integer :rich, null: false

      t.timestamps
    end
  end
end
