class Project < ActiveRecord::Base

  has_many :assignments
  has_many :programmers, :through => :assignments

  attr_accessible :description, :due_date, :title
end
