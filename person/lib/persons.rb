# encoding:UTF-8
# Persons Class
#2016/1/9
#2016/1/29 update
require_relative "../../group/lib/group"
class Persons < Group
  def getbychar(first_str)
    persons=Persons.new()
    @item_array.select{|person|person.startby?(first_str)}.each do |person|
      persons << person
    end
    return persons
  end
  def getbyid(id)
    @item_array.each do |person|
      return person if person.id==id
    end
    return nil
  end
  def getby(something)
    if something.class == Person
      @cond= -> person{person.name==something.name}
    end
    @result=Persons.new()
    super(something)
  end
  def getbyfname(fname)
    @result=Persons.new()
    @cond= -> person{person.fname==fname}
    public_method(:getby).super_method.call(fname)
    @result.each do |p|
      return p
    end
  end

end
