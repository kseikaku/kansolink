# encoding:UTF-8
# Shows Class
#2015/12/30

class Shows
  def initialize
   @shows_array=Array.new()
  end

  def add_show(s)
    @shows_array << s
  end

  def << (s)
    self.add_show(s)
  end

  def count
    @shows_array.count
  end

  def datestartby?(dt)
    @shows_array.each do |show|
     return true if show.datestartby?(dt)
      
    end
    return false
  end
  def getbydate(dt)
    return unless self.datestartby?(dt)

    shows=Shows.new()
    @shows_array.each do |show|
      shows << show if show.datestartby?(dt)
    end
    return shows
  end

  def charstartby?(char)
    @shows_array.each do |show|
      return true if show.startby?(char)
    end
    return false
  end
  def getbychar(char)
    return unless self.charstartby?(char)
    shows=Shows.new()
    @shows_array.each do |show|
      shows << show if show.startby?(char)
    end
    return shows
  end
  def placeat?(pla)
    @shows_array.each do |show|
      return true if show.placeat?(pla)
    end
    return false
  end
  def getbyplace(pla)
    shows=Shows.new()
    @shows_array.each do |show|
      shows << show if show.placeat?(pla)
    end
    return shows
  end
  def getbyid(id)
    @shows_array.each do |show|
      return show if show.id==id
    end
  end
  def each
    @shows_array.each do|show|
      yield show
    end
  end
  def concat(shows)
    shows.each do |show|
      @shows_array << show
    end
  end
end
