class Assignment < ActiveRecord::Base

  belongs_to :programmer
  belongs_to :project

  attr_accessible :hours_worked, :programmer_id, :project_id, :task
end
