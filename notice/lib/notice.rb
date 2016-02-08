# encoding:UTF-8
# Notice Class 演劇感想文リンクの更新情報とランキング情報を元にしたお知らせデータの作成。ブログ用とTwitter用を作る  
#2016/1/30
require "updates"
require "update"
require "updateselecter"
require_relative "../../ranking/lib/rankings"
require_relative "../../ranking/lib/ranking"
require_relative "../../loader/lib/xmlloader"
require_relative "../../loader/lib/companyloader"
require_relative "../../loader/lib/personsloader"
require_relative "../../loader/lib/contentsloader"
require_relative "../../loader/lib/contentsfilenamemaker"
require_relative "../../ga_content/lib/rankingmaker"
class Notice
  Weekly=1
  Monthly=2
  def initialize(update_date)
    @update_date=update_date
    @rankings_weekly=Rankings.new()
    @rankings_monthly=Rankings.new()
    @updates=Updates.new()
  end
  def load_update(folder_name='data/',persons_folder='data/people/')
    print "load_update start:"
    puts Time.now()
    
    xmlloader=XmlLoader.new(folder_name)
    @companies=xmlloader.companies
    @shows=xmlloader.shows
    @assignments=xmlloader.assignments

    print "load_update persongs start:"
    puts Time.now()

    personsloader=PersonsLoader.new(persons_folder+'people.xml')
    @persons=personsloader.persons


    updateselecter=UpdateSelecter.new(@companies)
    updateselecter.shows=@shows
    updateselecter.moddate=@update_date
    @updates=updateselecter.updates

    print "load_update end:"
    puts Time.now()

  end
  def load_ranking(folder_name='data/')
    print "load_ranking start:"
    puts Time.now()

    rankingmaker=RankingMaker.new()
    rankingmaker.companies=@companies
    rankingmaker.shows=@shows
    rankingmaker.assignments=@assignments
    rankingmaker.persons=@persons
    
    content_filename_maker=ContentsFilenameMaker.new(@update_date)

    filename=content_filename_maker.weekly_filename(folder_name) 
    load_contents_to_ranking(filename,rankingmaker,@rankings_weekly)
    filename=content_filename_maker.monthly_filename(folder_name) 
    load_contents_to_ranking(filename,rankingmaker,@rankings_monthly)

    print "load_ranking end:"
    puts Time.now    
  end
  def load_contents_to_ranking(contents_filename,rankingmaker,rankings)
    contentsloader=ContentsLoader.new(contents_filename)
    contents=contentsloader.contents
    contents.each do |content|
      next if content.type==ContentType.new(ContentType::Unknown)
      ranking=rankingmaker.makefrom(content)
      rankings << ranking   if ranking.class == Ranking
    end
  end

  def separate_rankings
    @persons_rankings_weekly=choose_rankings(@rankings_weekly,RankingType::RT_Person)
    @shows_rankings_weekly=choose_rankings(@rankings_weekly,RankingType::RT_Show)
    @company_rankings_weekly=choose_rankings(@rankings_weekly,RankingType::RT_Company)

    @persons_rankings_monthly=choose_rankings(@rankings_monthly,RankingType::RT_Person)
    @shows_rankings_monthly=choose_rankings(@rankings_monthly,RankingType::RT_Show)
    @company_rankings_monthly=choose_rankings(@rankings_monthly,RankingType::RT_Company)
  end
  def save_twitter_data(filename='data/data.txt')

    separation_length=@updates.count.div(3)
    separation_quo=@updates.count.modulo(3)

    twitter_lines=""

    twitter_lines=write_line(twitter_lines,@shows_rankings_monthly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[0..separation_length-1],"twitter_line")

    twitter_lines=write_line(twitter_lines,@company_rankings_monthly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[separation_length..separation_length*2-1],"twitter_line")

    twitter_lines=write_line(twitter_lines,@persons_rankings_monthly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[separation_length*2..@updates.count-1],"twitter_line")

    twitter_lines=write_line(twitter_lines,@shows_rankings_weekly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[0..separation_length-1],"twitter_line")

    twitter_lines=write_line(twitter_lines,@company_rankings_weekly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[separation_length..separation_length*2-1],"twitter_line")

    twitter_lines=write_line(twitter_lines,@persons_rankings_weekly,"twitter_line")

    twitter_lines=write_line(twitter_lines,@updates[separation_length*2..@updates.count-1],"twitter_line")
    #puts twitter_lines
    File.open(filename,'w'){|file| file.write(twitter_lines)}

  end
  def save_blog_data(filename='data/blog.txt')
    blog_lines=""
    blog_lines="<h3>今週更新された劇団</h3>\n"
    blog_lines="#{blog_lines}<ul>\n"
    blog_lines=write_line(blog_lines,@updates,"blog_line")
    blog_lines="#{blog_lines}</ul>\n"
    blog_lines="#{blog_lines}<h3>今週のアクセスランキング(公演)</h3>\n"
    blog_lines="#{blog_lines}<ol>\n"
    blog_lines=write_line(blog_lines,@shows_rankings_weekly,"blog_line")
    blog_lines="#{blog_lines}</ol>\n"
    blog_lines="#{blog_lines}<h3>今週のアクセスランキング(劇団)</h3>\n"
    blog_lines="#{blog_lines}<ol>\n"
    blog_lines=write_line(blog_lines,@company_rankings_weekly,"blog_line")
    blog_lines="#{blog_lines}</ol>\n"
    blog_lines="#{blog_lines}<h3>今週のアクセスランキング(劇作家／演出家／俳優)</h3>\n"
    blog_lines="#{blog_lines}<ol>\n"
    blog_lines=write_line(blog_lines,@persons_rankings_weekly,"blog_line")
    blog_lines="#{blog_lines}</ol>\n"

    File.open(filename,'w'){|file| file.write(blog_lines)}
  end

  private  
    def choose_rankings(rankings,rt_type_const)
      @result_rankings=rankings.getby(RankingType.new(rt_type_const))
      @result_rankings.sort!('asc')
      return @result_rankings[0..11]
    end
#linesは、出力予定文字列,groupは、対象。line_methodはitemに対して実行するメソッドの名称。
    def write_line(lines,group,line_method)
      group.each do |item|
      #  puts item.method(line_method).call
        lines="#{item.method(line_method).call}\n"  if lines.nil?
        lines="#{lines}#{item.method(line_method).call}\n"
      end
      return lines
    end
end