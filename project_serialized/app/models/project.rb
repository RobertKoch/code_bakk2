class Project < ActiveRecord::Base

  has_many :assignments
  has_many :programmers, :through => :assignments

  validates :title, :due_date, :presence => true

  attr_accessible :description, :due_date, :title
end
