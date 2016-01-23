# encoding:UTF-8
# Person Class
#2016/1/9
require '../name/lib/name'

class Person
  def initialize(nam)
    @name=Name.new()
    @name.name=nam
  end
  def name=(nam)
    @name.name=nam
  end
  def kname=(knam)
    @name.kname=knam
  end
  def fname=(fnam)
    @fname=fnam
  end
  def urlencode=(urle)
    @urlencode=urle
  end
  def wiki=(wik)
    @wiki=wik
  end
  def blog=(blg)
    @blog=blg
  end
  def twit=(twt)
    @twit=twt
  end

  def name
    return @name.name
  end
  def kname
    return @name.kname
  end
  def fname
    return @fname
  end
  def urlencode
    return @urlencode
  end
  def wiki
    return @wiki
  end
  def blog
    return @blog
  end
  def twit
    return @twit
  end
  def id
    return @name.name
  end
  def sortkey
    return @name.kname
  end
  def startby?(first_str)
    return @name.startby?(first_str)
  end
  def ==(person)
    return true if self.id==person.id
    return false
  end
end