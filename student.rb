require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, _classroom, name: 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
