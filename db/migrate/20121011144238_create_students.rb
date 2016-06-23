require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
    	t.string :name
	end
      # add columns that you would need for this table
      t.string :title
      t.text :description
      t.references :student_type
      t.integer :student_id
      t.string :first_name
      t.string :last_name
      t.timestamps	null: false 
    end
  end
end
