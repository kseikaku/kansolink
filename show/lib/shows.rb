# encoding:UTF-8
# Shows Class
#2015/12/30
require_relative "../../group/lib/group"
class Shows < Group

  def add_show(s)
    self << s
  end

  def getbydate(dt)
    return unless self.datestartby?(dt)

    shows=Shows.new()
    @item_array.each do |show|
      shows << show if show.datestartby?(dt)
    end
    return shows
  end

  def datestartby?(dt)
    @item_array.each do |show|
     return true if show.datestartby?(dt)
      
    end
    return false
  end

  def charstartby?(char)
    @item_array.each do |show|
      return true if show.startby?(char)
    end
    return false
  end
  def getbychar(char)
    return unless self.charstartby?(char)
    shows=Shows.new()
    @item_array.each do |show|
      shows << show if show.startby?(char)
    end
    return shows
  end
  def placeat?(pla)
    @item_array.each do |show|
      return true if show.placeat?(pla)
    end
    return false
  end
  def getbyplace(pla)
    shows=Shows.new()
    @item_array.each do |show|
      shows << show if show.placeat?(pla)
    end
    return shows
  end
  def getbyid(id)
    @item_array.each do |show|
      #puts show.id
      return show if show.id==id
    end
    return false
  end
  def getby(something)
    @result=Shows.new()
    if something.class==Company 
      @cond= -> show{show.companyid==something.id}
    end
    super(something)
  end
  def latest_show
    self.sort!("desc")
    return @item_array[0]
  end
end
