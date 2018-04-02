class CreateBeats < ActiveRecord::Migration[5.1]
  def change
    create_table :beats do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
