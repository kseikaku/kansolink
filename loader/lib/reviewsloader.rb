# encoding:UTF-8
# Reviewsloader Class
#2016/1/23
require "loader"
require "../review/lib/reviews"
require "../review/lib/review"
require "../show/lib/show"
class Reviewsloader < Loader
  def initialize(filename)
    super(filename)
  end

  def load
    super()
    @loaditems=Reviews.new()
    idx=0
    @doc.elements.each('company/shows/show') do |showitem|
      idx=idx+1
      str=idx.to_s
      show=Show.new(@basename+str)
      make_reviews(showitem,show)
    end
    make_return_items()
  end
  def make_reviews(showitem,show)
    showitem.elements.each('reviewers/reviewer') do |revitem|
      rev=Review.new(xmltext(revitem,'reviewers_url'))
      rev.name=xmltext(revitem,'reviewers_name')
      rev.review_date=xmltext(revitem,'reviewdate')
      rev.update_date=xmltext(revitem,'update')
      rev.show=show
      @items_array << rev
    end
  end
end
