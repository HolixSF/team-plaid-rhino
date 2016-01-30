class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, :null => false
      t.integer :response_to_id, :null => false
      t.string :response_to_type, :null => false
      t.string :text, :null => false

      t.timestamps
    end
    add_index :responses, :response_to_id
  end
end
