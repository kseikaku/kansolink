# encoding:UTF-8
# RankingMaker Class
# contentクラスからrankingを生成する
require_relative '../../ranking/lib/ranking'
require_relative '../../ga_content/lib/content'
require_relative '../../ga_content/lib/contenttype'
require_relative '../../person/lib/person'
require_relative '../../show/lib/show'
require_relative '../../company/lib/company'
class RankingMaker
  attr_writer :shows, :companies ,:persons ,:assignments
  def makefrom(content)
    ranking=Ranking.new(content.rank)
    ranking.fromdate=content.fromdate
    ranking.todate=content.todate
    if content.type==ContentType.new(ContentType::Company)

      ranking.type=RankingType.new(RankingType::RT_Company)
      ret=set_company_and_show(ranking,content)
      return nil unless ret
    
    elsif content.type==ContentType.new(ContentType::Show)

      ranking.type=RankingType.new(RankingType::RT_Show)
      ret=set_show_and_company(ranking,content)
      return nil unless ret

    elsif content.type==ContentType.new(ContentType::Person)

      ranking.type=RankingType.new(RankingType::RT_Person)
      ret=set_person_and_show(ranking,content)
      return nil unless ret

    end 

    return ranking

  end

  def set_company_and_show(ranking,content) #For COMPANY
    companyid=File.basename(content.page,'.html')
    company=@companies.getbyid(companyid)
    cshows=@shows.getby(company)
    ranking.show=cshows.latest_show
    ranking.company=company
  end
  def set_show_and_company(ranking,content) #For SHOW
    showid=File.basename(content.page,'.html')
    show=@shows.getbyid(showid)
    unless show
      print "can't make rankig because no show in shows:"
      puts showid
      return false
    end
    ranking.company=@companies.getbyid(show.companyid)
    ranking.show=show
  end
  def set_person_and_show(ranking,content) #For PERSON
    fname=File.basename(content.page)
    person=@persons.getbyfname(fname)
    unless person.class==Person
      print "can't make ranking because no person in persons:"
      puts fname
      puts content.page
      return false
    end

    passignments=@assignments.getby(person)
    unless passignments
      print "can't make ranking because no person in assignments:"
      puts person.name
      return false
    end
    ranking.person=person
    ranking.show=passignments.latest_show

  end

end