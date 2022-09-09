class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :likes
      t.integer :dislikes
      t.string :comment
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :song_id
    end
  end
end