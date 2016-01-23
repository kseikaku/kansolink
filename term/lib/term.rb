# encoding:UTF-8
# Term Class
class Term
  def initialize(fromdate)
    @fromdate=fromdate
    @todate=fromdate
  end
  def todate=(todate)
    @todate=todate
  end
  def fromdate
    @fromdate
  end
  def todate
    @todate
  end
end