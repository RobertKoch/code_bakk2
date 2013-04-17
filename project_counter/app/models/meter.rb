class Meter
  def self.create_programmers(max)
    time = Benchmark.realtime do
      DataManager.create_programmers max
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.add_programmers_to_projects(max)
    time = Benchmark.realtime do
      DataManager.add_programmers_to_projects max
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.delete_programmers
    time = Benchmark.realtime do
      DataManager.delete_all_programmers
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.read_programmers(max)
    time = Benchmark.realtime do
      DataManager.read_programmers max
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.get_top10_languages
    time = Benchmark.realtime do
      DataManager.get_top10_languages
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end

  def self.increment_counter
    time = Benchmark.realtime do
      DataManager.increment_counter
    end
    puts "Time elapsed #{time*1000} milliseconds"
  end
end