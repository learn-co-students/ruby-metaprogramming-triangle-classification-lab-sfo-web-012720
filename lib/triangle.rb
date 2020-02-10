class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  
  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c 
      :isosceles
    else
      :scalene
    end
  end
  
  def validate_triangle
    valid_triangle = [(a + b > c), (a + c > b), (b + c > a)]
      [a, b , c].each do |s|
        valid_triangle << false if s <= 0
      raise TriangleError if valid_triangle.include?(false)
      end
  end
  
  class TriangleError < StandardError
    puts "Not a triangle"
  end
end
