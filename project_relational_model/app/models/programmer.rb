class Programmer < ActiveRecord::Base

  has_and_belongs_to_many :programming_languages
  has_many :assignments
  has_many :projects, :through => :assignments

  validates :email, :firstname, :lastname, :presence => true
  validates :email, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i}

  attr_accessible :email, :firstname, :hourly_rate, :lastname
end
