class CreateProgrammersProgammingLanguagesTable < ActiveRecord::Migration
  def change
    create_table :programmers_programming_languages, :id => false do |t|
      t.references :programmer, :null => false
      t.references :programming_language, :null => false
    end

    # Adding the index can massively speed up join tables. Don't use the
    # unique if you allow duplicates.
    add_index(:programmers_programming_languages, [:programmer_id, :programming_language_id], :unique => true, :name => 'programmers_languages')
  end
end
