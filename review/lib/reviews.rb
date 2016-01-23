# encoding:UTF-8
# Reviews Class
#2016/1/19
class Reviews
  def initialize()
    @reviews_array=Array.new()
  end
  def count
    return @reviews_array.count
  end
  def <<(rev)
    @reviews_array << rev
  end
  def getby(something)
    case something.class.to_s
    when "Show"
      cond= -> review{review.show==something}
    when "Term"
      cond= -> review{review.update_between?(something)}
    when "String" #これは、日付であると推定
      cond= -> review{review.update_date==something}
    else
    end

    result_reviews=Reviews.new()
    @reviews_array.select{|review| cond.call(review)} .each do |review|
      result_reviews << review
    end
    return result_reviews
  end
  def each
    @reviews_array.each do |rev|
      yield rev
    end
  end
  def sort!
    @reviews_array.sort!{|a,b|
      a.sortkey <=> b.sortkey}
  end
end
