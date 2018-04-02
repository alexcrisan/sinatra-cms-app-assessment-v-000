class CreateBeatTags < ActiveRecord::Migration[5.1]
  def change
    create_table :beat_tags do |t|
      t.integer :beat_id
      t.integer :tag_id
    end
  end
end
