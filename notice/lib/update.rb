# encoding:UTF-8
# Update Class 
#2016/1/30
class Update
  OUTPUT_twitter=1
  OUTPUT_blog=2
  Twitter_HashTags=["#演劇","#舞台","#劇評","engeki.kansolink.com"]

  attr_reader :company, :type
  attr_writer :show, :show_count, :no

  def initialize(company)
    @company=company
  end
  def twitter_line
    line="今週更新された劇団 #{@no} #{@company.name} "
    line=line + "@"+@company.twit  if @company.twit
    line="#{line} http://engeki.kansolink.com/review/#{@company.id}.html"
    line="#{line} 最新作「#{@show.title}」他#{@show_count}作品の劇評"
    if line.length>129
      line="#{line}が読めます"
    else
      line="#{line}をお読みいただけます"
    end

    return line if line.length > 136

    Twitter_HashTags.each do |tag|
      break if line.length + tag.length + 1 >140
      line="#{line} #{tag}"
    end 

    return line
  end

  def blog_line
    line="<li><a href='http://engeki.kansolink.com/review/#{@company.id}.html'>#{@company.name}</a> " 
    line="#{line}最新作「<a href='http://engeki.kansolink.com/shows/#{@show.id}.html'>#{@show.title}</a>」他</li>"
    return line
  end
end
