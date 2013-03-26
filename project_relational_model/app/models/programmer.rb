class Programmer < ActiveRecord::Base

  has_and_belongs_to_many :programming_languages
  has_many :assignments
  has_many :projects, :through => :assignments

  attr_accessible :email, :firstname, :hourly_rate, :lastname
end
