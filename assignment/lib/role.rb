# encoding:UTF-8
# Role(役割) Class
#2016/1/9
class Role
  CAST=1
  WRITER=10
  DIRECTOR=100
  def initialize(value)
    @value=value
  end
  def <<(role)
      @value=@value+role.value
  end
  def value()
    return @value
  end
  def ==(role)
    #return true if self==value
    return true if @value==role.value

    self_str=sprintf("%04d",@value)
    value_str=role.value.to_s
    return true if self_str[4-value_str.length]==value_str[0]
    return false
     
  end
end