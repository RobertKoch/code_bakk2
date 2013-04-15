class Programmer < Ohm::Model
  include Ohm::DataTypes

  PROGRAMMING_LANGUAGES = "Ruby,Perl,PHP,JavaScript,C#,C++,Java,Python,HTML/CSS,ActionScript,Objective-C,SQL"

  attribute :email
  attribute :firstname
  attribute :lastname
  attribute :hourly_rate
  attribute :programming_languages, Type::Hash

  unique :email

  collection :assignments, :Assignment

  def validate
    assert_present :email
    assert_present :firstname
    assert_present :lastname
    assert_email :email
    assert_numeric :hourly_rate
  end

  def languages
    eval self.programming_languages
  end

  def self.possible_languages
    PROGRAMMING_LANGUAGES.split ','
  end

protected
  def after_save
    self.programming_languages.each do |l|
      Counter.increment_language(l[0]) if l[1] == 1
    end
  end

  def after_destroy
    self.programming_languages.each do |l|
      CSSounter.decrement_language(l[0]) if l[1] == 1
    end
  end
end
