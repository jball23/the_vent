class CreateVents < ActiveRecord::Migration
  def change
    create_table :vents do |t|
      t.string :name
      t.text :body
      t.string :mood
      t.boolean :allow_response, default: true
      t.timestamps null: false
    end
  end
end
