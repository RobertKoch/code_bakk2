class ProgrammingLanguage < Ohm::Model
  attribute :name
  attribute :type

  set :programmers, :Programmer

  def validate
    assert_present :name
  end
end
