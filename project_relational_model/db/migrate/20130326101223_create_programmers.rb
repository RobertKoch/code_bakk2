class CreateProgrammers < ActiveRecord::Migration
  def change
    create_table :programmers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
