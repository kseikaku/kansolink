# encoding:UTF-8
# Assignments Class
#2016/1/13
require_relative "../../group/lib/group"
require_relative "../../show/lib/shows"
class Assignments < Group
  def initialize()
    super()
    #@assign_array=Array.new()
    @assign_hash=Hash.new()
    @shows=Shows.new()
  end
  def <<(assign)
    assignid=assign.show.id+assign.person.id
    idx=@assign_hash[assignid]
    if idx
      @item_array[idx].role << assign.role
    else
      @assign_hash[assignid]=@item_array.count
      super(assign)
    end
    @shows << assign.show
  end
  def getby(something)
    #condで、selectするときの条件をオブジェクト化している。
    #-> assign{assign.show==something}はProc.new{|assign| assign.show==something}と同じ。
    if something.class==Show then
      @cond= -> assign{assign.show==something}
    elsif something.class==Person then
      @cond= -> assign{assign.person==something}
    elsif something.class==Role then
      @cond= -> assign{assign.role==something}
    else
      return nil
    end
    @result=Assignments.new()
    super(something)
  end
  def latest_show
    return @shows.latest_show
  end

end