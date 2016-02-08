# encoding:UTF-8
# UpdatesSelecter Class
# Companiesから該当日付に更新された劇団を選択し、Updatesクラスを作成する
#2016/1/30
require "update"
require "updates"
require_relative "../../company/lib/company"
class UpdateSelecter
  attr_reader :updates
  def initialize(companies)
    @companies=companies
    @updates=Updates.new()
  end
  def shows=(shows)
    @shows=shows
    select_update if @moddate
  end
  def moddate=(moddate)
    @moddate=moddate
    select_update if @shows
  end

  private
    def select_update
      update_companies=@companies.getbymoddate(@moddate)
      idx=0
      update_companies.each do |company|
        idx=idx+1
        update=Update.new(company)
        company_shows=@shows.getby(company)
        update.show_count=company_shows.count
        update.show=company_shows.latest_show
        update.no=idx

        @updates << update

      end
    end
end
