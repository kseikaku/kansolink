# encoding:UTF-8
# Assignments Class
#2016/1/13
class Assignments
  def initialize()
    @assign_array=Array.new()
    @assign_hash=Hash.new()
  end
  def <<(assign)
    assignid=assign.show.id+assign.person.id
    idx=@assign_hash[assignid]
    if idx
      @assign_array[idx].role << assign.role
    else
      @assign_hash[assignid]=@assign_array.count
      @assign_array << assign
    end
  end
  def count
    return @assign_array.count
  end
  def has?(something)
    return getby(something).count > 0
  end
  def getby(something)
    #condで、selectするときの条件をオブジェクト化している。
    #-> assign{assign.show==something}はProc.new{|assign| assign.show==something}と同じ。
    if something.class==Show then
      cond= -> assign{assign.show==something}
    elsif something.class==Person then
      cond= -> assign{assign.person==something}
    elsif something.class==Role then
      cond= -> assign{assign.role==something}
    else
      return nil
    end
    result_assignments=Assignments.new()
    @assign_array.select{|assign| cond.call(assign)} .each do |assign|
      result_assignments << assign
    end
    return result_assignments

  end
  def each
    @assign_array.each do |assign|
      yield assign
    end
  end
  def concat(assignments)
    assignments.each do |assign|
      @assign_array << assign
    end
  end

end