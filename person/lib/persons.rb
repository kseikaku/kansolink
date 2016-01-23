# encoding:UTF-8
# Persons Class
#2016/1/9

class Persons
  def initialize()
    @persons_array=Array.new()
  end
  def count
    return @persons_array.count
  end
  def <<(person)
    @persons_array << person
  end
  def getbychar(first_str)
    persons=Persons.new()
    @persons_array.select{|person|person.startby?(first_str)}.each do |person|
      persons << person
    end
    return persons
  end
  def getbyid(id)
    @persons_array.each do |person|
      return person if person.id==id
    end
    return nil
  end
  def each
    @persons_array.each do |person|
      yield person      
    end
  end
  def concat(persons)
    persons.each do |person|
      @persons_array << person 
    end
  end
  def has?(person)
    return true if @persons_array.select{|psn|psn==person}.count>0
    return false
  end

end
