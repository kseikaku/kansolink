# encoding:UTF-8
# Companies Class
#2016/1/1
require "../company/lib/company"
require "../group/lib/group"
class Companies < Group
  def getbyid(ci)
    @item_array.each do |c|
      return c if c.id==ci
    end
    return nil
  end
  def getbymoddate(md)
    companies=Companies.new()
    @item_array.each do |c|
      companies << c if c.moddate==md
    end
    return companies
  end
end
