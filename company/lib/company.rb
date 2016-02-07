# encoding:UTF-8
# Company Class
#2016/1/1
require_relative "../../name/lib/name"

class Company
  attr_reader :id
  attr_accessor :url, :moddate,:blog, :twit
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
  def name
    @name.name
  end
  def kname
    @name.kname
  end
  def link
    ret="<a href='http://engeki.kansolink.com/review/#{id}.html'>"
    ret="#{ret}#{@name.name}</a>"
    return ret
  end
end