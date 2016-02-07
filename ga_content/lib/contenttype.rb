# encoding:UTF-8
# ContentType Class
class ContentType
  attr_reader :type
  Show=1
  Company=2
  Person=3
  Unknown=9
  def initialize(type)
    @type=type
  end
  def ==(type)
    return true if @type==type.type
  end
  def value
    @type
  end
end