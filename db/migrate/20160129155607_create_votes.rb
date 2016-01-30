class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, :null => false
      t.integer :vote_for_id, :null => false
      t.string :vote_for_type, :null => false

      t.timestamps
    end

  end
end
