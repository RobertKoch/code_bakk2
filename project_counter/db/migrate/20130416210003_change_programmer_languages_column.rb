class ChangeProgrammerLanguagesColumn < ActiveRecord::Migration
  def up
    change_column :programmers, :programming_languages, :text
  end

  def down
    change_column :programmers, :programming_languages, :string
  end
end
