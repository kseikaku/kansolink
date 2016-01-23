# encoding:UTF-8
# AssignmentsLoader Class
#2016/1/14
require "rexml/document"
require "../show/lib/show"
require "../person/lib/person"
require "../person/lib/castsplitter"
require "../assignment/lib/assignment"
require "../assignment/lib/role"
require "../assignment/lib/assignments"
require "converter"

class AssignmentsLoader
  def initialize(filename)
    @filename=filename
    converter=Converter.new()
    @converted_filename=converter.convert(@filename)
    self.load
  end
  def load()
    doc=REXML::Document.new(File.open(@converted_filename))
    basename=File.basename(@filename,".xml")
    @assignments=Assignments.new()
    idx=0
    doc.elements.each('company/shows/show') do |showitem|
      idx=idx+1
      str=idx.to_s
      show=Show.new(basename+str)
      assigns_array=make_cast(show,showitem.elements['cast']) if showitem.elements['cast'] 
      assigns_array = add_assign(assigns_array,show,showitem.elements['director'],Role.new(Role::DIRECTOR))     
      assigns_array = add_assign(assigns_array,show,showitem.elements['writer'],Role.new(Role::WRITER)) 
      add_assignments(assigns_array)    
    end
  end
  def make_cast(show,item)
    casts=CastSplitter.new(item.text).get_casts
    assigns_array=Array.new()
    assigns_array=casts.map do |cast|
      role=Role.new(Role::CAST)
      person=Person.new(cast)
      assign=Assignment.new()
      assign.show=show
      assign.role=role
      assign.person=person
      assign
    end
    return assigns_array
  end
  def add_assign(assign_array,show,item,role)
    
    return assign_array unless item
   
    person=Person.new(item.text)
    assign=Assignment.new()
    assign.show=show
    assign.role=role
    assign.person=person
    
    assign_array.push(assign)
    return assign_array
  end
  def add_assignments(assigns_array)
    assigns_array.each do |assign|
      @assignments << assign
    end
  end
  def get_assigns
    return @assignments
  end
end