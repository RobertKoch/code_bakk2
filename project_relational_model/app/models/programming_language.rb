class ProgrammingLanguage < ActiveRecord::Base
  attribute :name
  attribute :type

  def validate
    assert_present :name
  end
end
