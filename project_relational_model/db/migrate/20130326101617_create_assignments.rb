class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :programmer_id
      t.integer :project_id
      t.decimal :hours_worked
      t.text :task

      t.timestamps
    end
  end
end
