class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if side_1 == side_2 || side_2 == side_3 || side_1 == side_3 # check if at least 2 sides are equal
      if side_1 == side_2 && side_2 == side_3 && side_1 == side_3 # if all equal => equilateral
        return_value = :equilateral
      elsif side_1 != side_2 || side_2 != side_3 || side_1 != side_3 # if at least 2 equal one pair is not equal => isosceles
        return_value = :isosceles  # if at least 2 equal one pair is not equal => isosceles
          return_value = :isosceles
      end
    elsif side_1 + side_2 < side_3 || side_2 + side_3 < side_1 || side_3 + side_1 < side_2
      raise TriangleError
    else
      return_value = :scalene
    end
    return_value
  end

  class TriangleError < StandardError
    def message
      "You've entered dimensions for an imposible triangle!  The sum of the lengths of "
      "any two sides must be greater than the length of the remaining side."
    end
  end
end
