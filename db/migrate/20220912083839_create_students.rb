class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :year_at_school
      t.integer :house_id
      t.timestamps
    end

  end
end
