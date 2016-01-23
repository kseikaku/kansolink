# encoding:UTF-8
# Name Class
class Name
  def initialize()
    table1={"が"=>"か","ぎ"=>"き","ぐ"=>"く","げ"=>"け","ご"=>"こ"}
    table2={"ざ"=>"さ","じ"=>"し","ず"=>"す","ぜ"=>"せ","ぞ"=>"そ"}
    table3={"だ"=>"た","ぢ"=>"ち","づ"=>"つ","で"=>"て","ど"=>"と"}
    table4={"ば"=>"は","び"=>"ぴ","ぶ"=>"ふ","べ"=>"へ","ぼ"=>"ほ"}
    table5={"ぱ"=>"は","ぴ"=>"ひ","ぷ"=>"ふ","ぺ"=>"へ","ぽ"=>"ほ"}
    @table=table1.merge(table2)
    @table=@table.merge(table3)
    @table=@table.merge(table4)
    @table=@table.merge(table5)
  end 
  def name=(nam)
    @name=nam
  end
  def kname=(knam)
    @kname=knam
  end
  
  def name
    return @name
  end
  def kname
    return @kname
  end
  def sortkey
    return @kname
  end
  def startby?(first_str)
    str1st=kname[0]
    return true  if str1st==first_str
    str1st_trans=@table[str1st]
    return true  if str1st_trans==first_str
    return false
  end  
end
