class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise TriangleError unless valid?
  end

  def valid?
    if !traingle_meets_inequality_rule?
      false
    elsif side1 <= 0 || side2 <= 0 || side3 <= 0
      false
    else
      true
    end
  end

  def traingle_meets_inequality_rule?
    sides = [side1, side2, side3]
    sides.sort!
    sides[0] + sides[1] > sides[2] ? true : false
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

end

class TriangleError < StandardError
  def message
    "Invalid triangle!"
  end
end
