class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :task
      t.string :category_name
      t.boolean :completed 
      t.integer :category_id
    end
  end
end
