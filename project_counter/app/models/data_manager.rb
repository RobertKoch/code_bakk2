class DataManager
  #this class only creates and destroys a lot of records for this little application

  #CREATE ENTRIES
  def self.create_programmers(max)
    (1..max+1).each do |i|
      p = Programmer.new(
        :firstname => "John",
        :lastname => "Number#{i}",
        :email => "programmer#{i}@helloworld.at",
        :hourly_rate => rand(25 .. 150),
        :programming_languages => self.create_language_hash
      )
      p.save!
    end
  end

  def self.create_language_hash
    language_hash = {}
    Programmer.possible_languages.each do |l|
      language_hash[l] = rand(0..1)
    end
    language_hash
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

  def self.add_programmers_to_projects(max)
    number_of_programmers = Programmer.all.count
    Project.all.sort(:limit => [0, max]).each do |project|
      assignment = Assignment.new
      assignment.project = project
      assignment.programmer = Programmer[rand(number_of_programmers -1)]
      assignment.task = "Description of the assignment"
      assignment.hours_worked = 0
      assignment.save!
    end
  end

  def self.get_top10_languages
    counts = {} 
    
    Programmer.possible_languages.each do |language|
      counts[language] = Counter.get_language_count(language)
    end

    counts = counts.sort_by {|key, value| -value}
    counts.take(10).each do |c|
      p "#{c[0]}: #{c[1]} Programmers"
    end
  end

  def self.read_programmers(max)
    500.times do
      Programmer.all.sort(:limit => [0, max])
    end
  end

  #DELETE ENTRIES
  def self.delete_all_projects
    Project.all.each do |p|
      p.delete
    end
  end

  def self.delete_all_programmers
    Programmer.all.each do |p|
      p.delete
    end
  end

  def self.delete_programmers_from_projects
    Assignment.all.each do |as|
      as.delete
    end
  end
end
