# encoding:UTF-8
# Content Class(Google analystics content ranking's 1 line data)
#2016/1/26
require_relative "../../ga_content/lib/contenttype"
require_relative "../../term/lib/term"
class Content
  attr_accessor :pv,:line,:rank
  attr_reader :page,:type
  def page=(page)
    @page=page
    @type=ContentType.new(ContentType::Unknown)
    return unless @page
    return unless File.dirname(@page)
    case File.dirname(page)
    when '/review'
      @type=ContentType.new(ContentType::Company)
    when '/shows'
      @type=ContentType.new(ContentType::Show)
    when '/people'
      @type=ContentType.new(ContentType::Person)
    else
      @type=ContentType.new(ContentType::Unknown)
    end
  end
  def fromdate=(fromdate)
    @term=Term.new(fromdate)
  end
  def todate=(todate)
    @term.todate=todate
  end
  def fromdate
    return @term.fromdate
  end
  def todate
    return @term.todate
  end
  def termtype
    return @term.termtype
  end
  def ==(content)
    return true if @page==content.page && @line==content.line
    return false
  end
end
