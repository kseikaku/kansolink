# encoding:UTF-8
# notice maker
#2016/2/6
$:.unshift File.dirname(__FILE__)
require "notice"
today=Time.now
update= ARGV[0] || today.strftime("%Y/%m/%d")
notice=Notice.new(update)
p update 
notice.load_update("/Users/kseikaku/Dropbox/Private/web/Data/XML/src/Kansolink/review/","/Users/kseikaku/Dropbox/Private/web/Data/XML/src/Kansolink/people/")
notice.load_ranking("/Users/kseikaku/Downloads/")
notice.separate_rankings
notice.save_twitter_data()
notice.save_blog_data()
