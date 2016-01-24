# encoding:UTF-8
# Review Class
#2016/1/13
require "date"
require "../review/lib/reviewer"
class Review
  def initialize(url)
    @url=url
  end
  def show=(show)
    @show=show
  end
  def name=(name)
    @reviewer=Reviewer.new(name)    
  end
  def review_date=(date_string)
    @review_date=date_string
  end
  def update_date=(date_string)
    @update_date=date_string
  end
  def name
    return @reviewer.name
  end
  def url
    return @url
  end
  def review_date
    return @review_date
  end
  def update_date
    return @update_date
  end
  def valid?
    return true if @url && @reviewer.valid?
    return false
  end
  def sortkey
    return @review_date
  end
  def rev_year_month
    return @review_date[0..6]
  end
  def show
    return @show
  end
  def update_between?(term)
    return false if @update_date < term.fromdate
    return false if @update_date > term.todate
    return true
  end
end
