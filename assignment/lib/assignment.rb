# encoding:UTF-8
# Person Class
#2016/1/9
class Assignment
  PERSON=1
  REVIEWER=2
  def initialize()
  end
  def show=(show)
    @show=show
  end
  def role=(role)
    @role=role
  end
  def person=(person)
    @person=person
    @type=PERSON
  end
  def show
    return @show
  end
  def person
    return @person
  end
  def role
    return @role
  end
end