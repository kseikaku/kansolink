# encoding:UTF-8
# Company Class
#2016/1/1
require "../name/lib/name"

class Company
  def initialize(companyid)
    @id=companyid
    @name=Name.new()
  end

  def name=(nam)
    @name.name=nam
  end
  def kname=(kn)
    @name.kname=kn
  end
  def url=(u)
    @url=u
  end
  def moddate=(dt)
    @moddate=dt
  end

  def id
    @id
  end
  def name
    @name.name
  end
  def kname
    @name.kname
  end
  def url
    @url
  end
  def moddate
    @moddate
  end
   
end