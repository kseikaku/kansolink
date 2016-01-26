# encoding:UTF-8
# Term Class
require "date"
class Term
  def initialize(fromdate)
    @fromdate=fromdate
    @todate=fromdate
    @termtype=TermType.new(TermType::Daily)
  end
  def todate=(todate)
    @todate=todate
    return if todate==fromdate
    
    case self.length()
      when 6
        @termtype=TermType.new(TermType::Weekly)
      when 27,28,29,30 
        @termtype=TermType.new(TermType::Monthly)
      else
        @termtype=TermType.new(TermType::Undefine)
    end
  end
  def fromdate
    @fromdate
  end
  def todate
    @todate
  end
  def termtype
    @termtype
  end
  def length
    from=Date.parse(@fromdate)
    to=Date.parse(@todate)
    return to-from
  end
end

class TermType
  Daily=1
  Weekly=2
  Monthly=3
  Undefine=9
  def initialize(int)
    @type=int
  end
  def type
    @type
  end
  def ==(termtype)
    return true if @type==termtype.type
    return false
  end
end
