class Map

  attr_accessor :hash

  def initialize
    @hash = Hash.new { }
  end

  def set(key, value)
    @hash[key] = value
  end

  def get(key)
    @hash[key]
  end

  def delete(key)
    @hash.delete(key)
  end

  def show
    @hash
  end

  def update(key, value)
    @hash[key] = value
  end
end
