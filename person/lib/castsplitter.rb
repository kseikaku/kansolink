# encoding:UTF-8
# CastSplitter Class
#2016/1/14
class CastSplitter
  def initialize(text)
    @casts=text.split(',')
    @casts=text.split('、') if @casts.count==1
    @casts=text.split('/') if @casts.count==1
    @casts=text.split('／') if @casts.count==1
    @casts=text.split('　') if @casts.count==1
    @casts=text.split() if @casts.count==1
  end
  def get_casts
    return @casts
  end
end
