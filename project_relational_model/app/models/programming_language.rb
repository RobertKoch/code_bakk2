class ProgrammingLanguage < ActiveRecord::Base

  has_and_belongs_to_many :programmers

  attr_accessible :name, :type
end
