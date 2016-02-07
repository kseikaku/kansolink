# encoding:UTF-8
# Loader Class(loaderの抽象クラス)
#2016/1/23
require_relative "../../loader/lib/converter"
require "rexml/document"
class Loader
  def initialize(filename)
    @filename=filename
    @converted_filename=Converter.new().convert(filename)
    self.load
  end
  def load
    @doc=REXML::Document.new(File.open(@converted_filename))
    @basename=File.basename(@filename,".xml")
    @items_array=Array.new()
    #puts @basename

    rescue => ex
    puts @filename
    puts ex.message
    puts ex.class
    puts ex.backtrace
  end
  def make_return_items()
    @items_array.each do |item|
      @loaditems << item
    end
    @loaditems.count
  end
  def get_items
    return @loaditems
  end
  def xmltext(item,dtd)
    return item.elements[dtd].text if item.elements[dtd] 
  end
end
