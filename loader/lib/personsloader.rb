# encoding:UTF-8
# Personsloader Class
#2016/1/10
require "rexml/document"
require '../loader/lib/converter'
require '../person/lib/persons'
require '../person/lib/person'

class PersonsLoader
  attr_reader :persons
  def initialize(filename)
    @filename=filename
    @converter=Converter.new()
    self.load
  end
  def load
    converted_filename=@converter.convert(@filename)
    xml=File.open(converted_filename)
    doc=REXML::Document.new(xml)
    @persons=Persons.new()
    #puts doc.elements['peoples']
    #puts doc.elements['peoples'].count
    doc.elements['peoples'].each do |people|
      next unless people.class == REXML::Element
      #puts people.elements['name'].text if people.elements['name']
      #puts people.elements['fname'].text if people.elements['fname']
      person=Person.new(people.elements['name'].text)
      person.kname=people.elements['kname'].text  if people.elements['kname']
      person.fname=people.elements['fname'].text  if people.elements['fname']
      person.urlencode=people.elements['urlencode'].text  if people.elements['urlencode']
      person.wiki=people.elements['wiki'].text  if people.elements['wiki']
      person.blog=people.elements['blog'].text  if people.elements['blog']
      @persons << person
    end
  end

  def get_persons
    return @persons
  end
end
