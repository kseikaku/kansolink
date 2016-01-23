# encoding:UTF-8
# Show Class
require "../name/lib/name"
require "../show/lib/schedule"

class Show
  
  def initialize(strShowid)
    @id=strShowid
    @title=Name.new()
    @schedule=Schedule.new()
  end
  def title
    return @title.name
  end
  def sortkey
    return @title.sortkey
  end
  def startby?(start_char)
    return @title.startby?(start_char)
  end
  def fromdate
    @schedule.fromdate
  end
  def todate
    @schedule.todate
  end
  def theater
    @schedule.place
  end
  def companyid
    @companyid
  end

  def title=(tit)
    @title.name=tit
  end
  def ktitle=(tit)
    @title.kname=tit
  end
  def fromdate=(dt)
    @schedule.fromdate=dt
  end
  def todate=(dt)
    @schedule.todate=dt
  end
  def theater=(theater)
    @schedule.place=theater
  end
  def moddate=(mod)
    @moddate=mod
  end
  def id
    return @id
  end
  def placeat?(pla)
    return @schedule.placeat?(pla) 
  end
  def datestartby?(ym)
    return @schedule.startby?(ym)
  end
  def term
    return @schedule.term
  end
  def companyid=(ci)
    @companyid=ci
  end
  def moddate
    return @moddate
  end
  def ==(show)
    return true if self.id==show.id
    return false
  end
end