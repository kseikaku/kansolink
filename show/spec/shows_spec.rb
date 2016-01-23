# -*- encoding:UTF-8-*-
require "spec_helper"
require "shows"
require "show"
describe Shows do
  before do
    @shows=Shows.new()
    @shows2=Shows.new
    show1=Show.new("test01")
    show1.title="テスト1"
    show1.ktitle="てすと１"
    show1.fromdate="2015/01/20"
    show1.todate="2015/01/30"
    show1.theater="駅前劇場(下北沢)"
    @shows.add_show(show1)
    @shows2.add_show(show1)
    show2=Show.new("test02")
    show2.title="トステ2"
    show2.ktitle="とすて2"
    show2.fromdate="2015/02/20"
    show2.todate="2015/02/30"
    show2.theater="銀河劇場(天王州)"
    @shows.add_show(show2)
    @shows2.add_show(show1)
  end
	describe "showsの基本的な振る舞い" do 
		it "showの数は2個" do
			expect(@shows.count).to eq 2
		end
    it "2015/01に実施された公演は１件" do
      expect(@shows.datestartby?("2015/01")).to be true
      shows_201501=@shows.getbydate("2015/01")
      expect(shows_201501.count).to eq 1
    end
    it "てで始まる公演は1件" do
      expect(@shows.charstartby?("て")).to be true
      expect(@shows.charstartby?("さ")).to be false
      shows_te=@shows.getbychar("て")
      expect(shows_te.count).to eq 1
    end
    it "銀河劇場で実施した公演は１件" do
      expect(@shows.placeat?("銀河劇場")).to be true
      shows_ginga=@shows.getbyplace("銀河劇場")
      expect(shows_ginga.count).to eq 1
    end
    it "帰ってきたShowのタイトルは、引き渡したもの" do
      @shows.each do |show|
        if show.id=="test01"
          expect(show.title).to eq "テスト1"
        else
          expect(show.title).to eq "トステ2"
        end
        
      end
    end
    it "concatでshowsを接続" do
      @shows.concat(@shows2)
      expect(@shows.count).to eq 4
    end
    it "idでshowを取得" do
      show=@shows.getbyid("test01")
      expect(show.title).to eq "テスト1"
    end
  end

end
