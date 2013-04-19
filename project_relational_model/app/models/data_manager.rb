class DataManager
  #this class only creates and destroys a lot of records for this little application

  #CREATE ENTRIES
  def self.create_programming_languages
    ["Ruby","Perl","PHP","JavaScript","C#","C++","Java","Python","HTML/CSS","ActionScript","Objective-C","SQL"].each do |l|
      p = ProgrammingLanguage.new(:name => l)
      p.save!
    end
  end

  def self.create_programmers(max)
    (1..max+1).each do |i|
      p = Programmer.new(
        :firstname => "John",
        :lastname => "Number#{i}",
        :email => "programmer#{i}@helloworld.at",
        :hourly_rate => rand(25 .. 150)
      )
      p.save!
    end
  end

  def self.create_projects(max)
    (1..max+1).each do |i|
      p = Project.new(
        :title => "Project ##{i}",
        :description => "Project ##{i}",
        :due_date => DateTime.now + 1.month + i.days
      )
      p.save!
    end
  end

  def self.add_languages_to_programmers(max)
    all_languages = ProgrammingLanguage.all
    lang_max = all_languages.count - 1
    Programmer.all(:limit => max).each do |p|
      languages = [all_languages[0], all_languages[rand(1 .. lang_max)]]
      p.programming_languages << languages
    end
  end

  def self.add_programmers_to_projects(max)
    Project.all(:limit => max).each do |project|
      assignment = Assignment.new
      assignment.project = project
      assignment.programmer = Programmer.first(:offset => rand(Programmer.count -1))
      assignment.task = "Description of the assignment"
      assignment.hours_worked = 0
      assignment.save!
    end
  end

  def self.get_top10_languages
    #MySQL version:
    #top10 = ProgrammingLanguage.joins(:programmers).group("programming_languages.id").order("count(programmers.id) DESC").limit(10)
    
    #version for comparision with redis
    top10 = ProgrammingLanguage.all.to_a.sort_by {|p| [-p.programmers.count, p.name]}
    top10.take(10).each do |lang|
      p lang.name+": "+lang.programmers.count.to_s+" Programmers"
    end
  end

  def self.read_programmers(max)
    500.times do
      Programmer.limit(max).all
    end
  end

  #DELETE ENTRIES
  def self.delete_all_programming_languages
    ProgrammingLanguage.destroy_all
  end

  def self.delete_all_projects
    Project.destroy_all
  end

  def self.delete_all_programmers
    Programmer.destroy_all
  end

  def self.delete_programmers_from_projects
    Assignment.destroy_all
  end
end