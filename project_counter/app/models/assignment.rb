class Assignment < Ohm::Model

  attribute :hours_worked
  attribute :task

  reference :programmer, :Programmer
  reference :project, :Project
  #active-record-like:
  #belongs_to :programmer
  #belongs_to :project

  def validate
    assert_present :programmer
    assert_present :project
    assert_numeric :hours_worked
  end
end