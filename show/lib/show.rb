# encoding:UTF-8
# Show Class
require_relative "../../name/lib/name"
require_relative "../../show/lib/schedule"

class Show
  attr_accessor :companyid , :moddate
  def initialize(strShowid)
    @id=strShowid
    @title=Name.new()
    @schedule=Schedule.new()
  end
  def title
    return @title.name
  end
  def sortkey
    return @schedule.fromdate
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
  def ==(show)
    return true if self.id==show.id
    return false
  end
  def link
    ret="<a href='http://engeki.kansolink.com/shows/#{id}.html'>"
    ret="#{ret}#{@title.name}</a>"
    return ret
  end
end