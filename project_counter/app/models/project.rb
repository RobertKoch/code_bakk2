class Project < Ohm::Model
  attribute :description
  attribute :due_date
  attribute :title

  collection :assignments, :Assignment
  #active-record-like:
  #has_many :assignments
  #has_many :programmers, :through => :assignments

  def validate
      assert_present :title
      assert_present :due_date
  end
end