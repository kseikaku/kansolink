# encoding:UTF-8
# Rank Class(Rankingクラスの順位を示すクラス)
#2016/1/24
class Rank
  attr_reader :no
  def initialize(int)
    @no=int
  end
  def ==(rank)
    return true if @no==rank.no
    return false
  end
  def to_s
    return "#{@no.to_s}位"
  end
end
