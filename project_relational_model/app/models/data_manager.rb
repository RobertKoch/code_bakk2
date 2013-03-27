class DataManager
  #this class only creates and destroys a lot of records for this little application

  #CREATE ENTRIES
  def self.create_programming_languages
    #inactive Example for benchmarking
    #time = Benchmark.realtime do
      ["Ruby","Perl","PHP","JavaScript","C#","C++","Java","Python","HTML/CSS","ActionScript","Objective-C","SQL"].each do |l|
        p = ProgrammingLanguage.new(:name => l)
        p.save!
      end
    #end
    #puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.create_programmers
    (1..100).each do |i|
      p = Programmer.new(
        :firstname => "John",
        :lastname => "Number#{i}",
        :email => "programmer#{i}@helloworld.at",
        :hourly_rate => rand(25 .. 150)
      )
      p.save!
    end
  end

  def self.create_projects
    (1..100).each do |i|
      p = Project.new(
        :title => "Project ##{i}",
        :description => "Project ##{i}",
        :due_date => DateTime.now + 1.month + i.days
      )
      p.save!
    end
  end

  def self.add_languages_to_programmers
    max = ProgrammingLanguage.count - 1
    all_languages = ProgrammingLanguage.all
    Programmer.all.each do |p|
      languages = [all_languages[0], all_languages[rand(1 .. max)]]
      p.programming_languages << languages
    end
  end

  def self.add_programmers_to_projects
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
  end
end