class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.string :programming_languages

      t.timestamps
    end
  end
end
