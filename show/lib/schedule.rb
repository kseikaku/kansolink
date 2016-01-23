# encoding:UTF-8
# Schedule Class has place and date
class Schedule

  def place=(pla)
    @place=pla
    return unless @place
    #return  unless @place.index("(")　
    @place.gsub!("（","(")
    @place.gsub!("）",")")
    if @place.index("(") && @place.index(")")
      #かっこに含まれている文字列は、@stationに格納
      station_start=@place.index("(")+1
      station_end=@place.index(")")-1   
      @station=@place[station_start..station_end]
      @place=@place[0..station_start-2]
    end
  end
  def fromdate=(dt)
    @fromdate=dt
    @todate=dt unless @todate
  end
  def todate=(dt)
    @todate=dt
  end

  def place
    return @place
  end
  def fromdate
    return @fromdate
  end
  def todate
    return @todate
  end
  def term
    return @fromdate if @fromdate==@todate
    return @fromdate+"〜"+@todate
  end 
  def startby?(ym)
    fromym=fromdate[0..6]
    return true if fromym==ym
    return false
  end
  def placeat?(pla)
    return true if @place==pla
    return false
  end
end
