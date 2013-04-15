class Counter
  def self.increment_language(language)
    Ohm.redis.incr "count:"+language
  end

  def self.decrement_language(language)
    Ohm.redis.decr "count:"+language
  end

  def self.get_language_count(language)
    Ohm.redis.get("count:"+language).to_i
  end
end
