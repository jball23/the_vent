class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.text :body
      t.integer :vent_id  
      t.timestamps null: false
    end
  end
end
