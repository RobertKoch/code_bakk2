class Programmer < Ohm::Model

  attribute :email
  attribute :firstname
  attribute :lastname
  attribute :hourly_rate

  unique :email

  collection :programming_languages, :Programming_language
  collection :assignments, :Assignment
  #active-record-like:
  #has_and_belongs_to_many :programming_languages
  #has_many :assignments
  #has_many :projects, :through => :assignments

  def validate
    assert_present :email
    assert_present :firstname
    assert_present :lastname
    assert_email :email
    assert_numeric :hourly_rate
  end
end
