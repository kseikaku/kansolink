# encoding:UTF-8
# Group Class(〜sシリーズのクラスの抽象クラス)
#2016/1/24
class Group
  def initialize()
    @item_array=Array.new
  end
  def <<(item) 
    @item_array << item
  end
  def count
    return 0 unless @item_array
    return @item_array.count
  end
  def concat(group)
    group.each do |item|
      @item_array << item
    end
  end
  def each
    @item_array.each do |item|
      yield item
    end
  end
  def getby(something)
    @item_array.select{|item| @cond.call(item) } .each do |item|
      @result << item
    end
    return false if @result.nil?
    return false if @result.count==0
    return @result
  end
  def has?(something)
    return true if getby(something) && getby(something).count > 0
    return false
  end
  def sort!(order="asc")
    if order=="desc"
      @item_array.sort!{|a,b| b.sortkey <=> a.sortkey}
    elsif order=="asc"
      @item_array.sort!{|a,b| a.sortkey <=> b.sortkey}
    end
  end
  def [](index)
    @item_array[index]
  end
end
