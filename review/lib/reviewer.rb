# encoding:UTF-8
# Reviewer Class
#2016/1/23
require "../name/lib/name"
class Reviewer
  def initialize(name)
    @name=Name.new()
    @name.name=name
    @valid=validate(name)
  end
  def name
    @name.name
  end
  def valid?
    @valid
  end
  def validate(name)
    not_exists=["あおし","藤田一樹","いっちゃん","長谷部真美子","織田百合子","いわし","わたなべ","吉俊",
      "松本和也","内田公平","中田満之"]
    return !not_exists.index(name)
  end
end