# encoding:UTF-8
# AssignmentsLoader Class
#2016/1/14
require "../loader/lib/loader"
require "../show/lib/show"
require "../person/lib/person"
require "../person/lib/castsplitter"
require "../assignment/lib/assignment"
require "../assignment/lib/role"
require "../assignment/lib/assignments"

class AssignmentsLoader < Loader
  def initialize(filename)
    super(filename)
  end
  def load()
    super()
    @loaditems=Assignments.new()
    idx=0
    @doc.elements.each('company/shows/show') do |showitem|
      idx=idx+1
      str=idx.to_s
      show=Show.new(@basename+str)
      @items_array=make_cast(show,xmltext(showitem,'cast'))
      @items_array= add_assign(@items_array,show,xmltext(showitem,'director'),Role.new(Role::DIRECTOR))     
      @items_array= add_assign(@items_array,show,xmltext(showitem,'writer'),Role.new(Role::WRITER)) 
      #add_assignments(assigns_array)    
    end
    make_return_items
  end
  def make_cast(show,item)
    unless item
      if @items_array
        return @items_array
      else
        return Array.new
      end
    end
    casts=CastSplitter.new(item).get_casts
    assigns_array=casts.map do |cast|
      role=Role.new(Role::CAST)
      person=Person.new(cast)
      assign=Assignment.new()
      assign.show=show
      assign.role=role
      assign.person=person
      assign
    end
    @items_array.concat(assigns_array)
  end
  def add_assign(assign_array,show,item,role)
    
    return assign_array unless item
   
    person=Person.new(item)
    assign=Assignment.new()
    assign.show=show
    assign.role=role
    assign.person=person
    
    assign_array.push(assign)
    return assign_array
  end
  def get_assigns
    get_items 
  end
end