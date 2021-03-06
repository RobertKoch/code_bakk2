class Programmer < ActiveRecord::Base

  PROGRAMMING_LANGUAGES = "Ruby,Perl,PHP,JavaScript,C#,C++,Java,Python,HTML/CSS,ActionScript,Objective-C,SQL"

  has_many :assignments
  has_many :projects, :through => :assignments

  attr_accessible :email, :firstname, :hourly_rate, :lastname, :programming_languages
  
  serialize :programming_languages, JSON

  validates :email, :firstname, :lastname, :presence => true
  validates :email, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i}
  validates_uniqueness_of :email

  def self.possible_languages
    PROGRAMMING_LANGUAGES.split ','
  end
end
