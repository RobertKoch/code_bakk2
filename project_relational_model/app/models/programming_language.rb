class ProgrammingLanguage < Ohm::Model
  attribute :name
  attribute :type

  reference :programmer, :Programmer

  def validate
    assert_present :name
  end
end
