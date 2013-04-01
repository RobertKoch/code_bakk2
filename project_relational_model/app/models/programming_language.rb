class ProgrammingLanguage < Ohm::Model
  attribute :name
  attribute :type

  def validate
    assert_present :name
  end
end
