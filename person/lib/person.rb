# encoding:UTF-8
# Person Class
#2016/1/9
require_relative '../../name/lib/name'

class Person
  attr_accessor :fname, :wiki, :blog, :twit, :urlencode
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

  def name
    return @name.name
  end
  def kname
    return @name.kname
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
  def link
    ret="<a href='http://engeki.kansolink.com/people/#{@fname}'>"
    ret="#{ret}#{@name.name}</a>"
    return ret
  end
end