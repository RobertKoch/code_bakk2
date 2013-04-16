class ChangeCounterProgrammerLanguagesColumn < ActiveRecord::Migration
  def up
    change_column :counters, :programming_languages, :text
  end

  def down
    change_column :counters, :programming_languages, :string
  end
end
