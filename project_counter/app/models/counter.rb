class Counter < ActiveRecord::Base
  attr_accessible :programming_languages

  serialize :programming_languages, JSON

  after_initialize :set_programming_languages

  def increment_language(language)
    languages = self.programming_languages
    languages[language] += 1
    self.update_attribute :programming_languages, languages
  end

  def decrement_language(language)
    languages = self.programming_languages
    languages[language] -= 1
    self.update_attribute :programming_languages, languages
  end

  def get_language_count(language)
    self.programming_languages[language]
  end

private
  def set_programming_languages
    if self.programming_languages.nil?
      language_hash = {}
      Programmer.possible_languages.each do |l|
        language_hash[l] = 0
      end
      self.programming_languages = language_hash
    end
  end
end
