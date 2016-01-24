# encoding:UTF-8
# Companies Class
#2016/1/1
require "../company/lib/company"

class Companies
  def initialize
      @company_array=Array.new
  end
  def <<(company)
    @company_array << company
  end 
  def count
    @company_array.count
  end
  def getbyid(ci)
    @company_array.each do |c|
      return c if c.id==ci
    end
    return nil
  end
  def getbymoddate(md)
    @company_array.each do |c|
      return c if c.moddate==md
    end
    return nil

  end
end
