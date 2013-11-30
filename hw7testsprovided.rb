# University of Washington, Programming Languages, Homework 7,
# hw7testsprovided.rb

require "./hw7.rb"

#  Will not work completely until you implement all the classes and their methods

# Will print only if code has errors; prints nothing if all tests pass

# These tests do NOT cover all the various cases, especially for intersection

#Constants for testing
ZERO = 0.0
ONE = 1.0
TWO = 2.0
THREE = 3.0
FOUR = 4.0
FIVE = 5.0
SIX = 6.0
SEVEN = 7.0
EIGHT = 8.0
TEN = 10.0

#Point Tests
a = Point.new(THREE,FIVE)
if not (a.x == THREE and a.y == FIVE)
	puts "Point is not initialized properly"
end
if not (a.eval_prog([]) == a)
	puts "Point eval_prog should return self"
end
if not (a.preprocess_prog == a)
	puts "Point preprocess_prog should return self"
end
a1 = a.shift(THREE,FIVE)
if not (a1.x == SIX and a1.y == TEN)
	puts "Point shift not working properly"
end
a2 = a.intersect(Point.new(THREE,FIVE))
if not (a2.x == THREE and a2.y == FIVE)
	puts "Point intersect not working properly"
end
a3 = a.intersect(Point.new(FOUR,FIVE))
if not (a3.is_a? NoPoints)
	puts "Point intersect not working properly"
end
line1 = Line.new(FOUR, FIVE)
a4 = line1.intersect(a)
if not (a4.is_a? NoPoints)
	puts "Point intersect Line not working properly"
end
line2 = Line.new(ONE, TWO)
a5 = line2.intersect(a)
if not (a5.x == THREE and a5.y == FIVE)
	puts "Point intersect Line not working properly"
end
verticalLine1 = VerticalLine.new(THREE)
a6 = verticalLine1.intersect(a)
if not (a6.x == THREE and a6.y == FIVE)
	puts "Point intersect VerticalLine not working properly"
end
verticalLine2 = VerticalLine.new(ONE)
a7 = verticalLine2.intersect(a)
if not (a7.is_a? NoPoints)
	puts "Point intersect VerticalLine not working properly"
end
lineSegment1 = LineSegment.new(-THREE, -SIX, ONE,TWO)
a8 = lineSegment1.intersect(a)
if not (a8.is_a? NoPoints)
	puts "Point intersect LineSegment not working properly 1"
end
lineSegment2 = LineSegment.new(-THREE, -SIX, ONE,TWO)
a9 = lineSegment2.intersect(Point.new(ONE, TWO))
if not (a9.x == ONE and a9.y == TWO)
	puts "Point intersect LineSegment not working properly 2"
end
lineSegment3 = LineSegment.new(-THREE, -SIX, ONE,TWO)
a10 = lineSegment3.intersect(Point.new(TWO, FOUR))
if not (a10.is_a? NoPoints)
	puts "Point intersect LineSegment not working properly 3"
end

#Line Tests
b = Line.new(THREE,FIVE)
if not (b.m == THREE and b.b == FIVE)
    puts "Line not initialized properly"
end
if not (b.eval_prog([]) == b)
    puts "Line eval_prog should return self"
end
if not (b.preprocess_prog == b)
    puts "Line preprocess_prog should return self"
end

b1 = b.shift(THREE,FIVE)
if not (b1.m == THREE and b1.b == ONE)
    puts "Line shift not working properly"
end

b2 = b.intersect(Line.new(THREE,FIVE))
if not (((b2.is_a? Line)) and b2.m == THREE and b2.b == FIVE)
    puts "Line intersect not working properly"
end
b3 = b.intersect(Line.new(THREE,FOUR))
if not ((b3.is_a? NoPoints))
    puts "Line intersect not working properly"
end
b4 = b.intersect(Line.new(ONE, TWO))
if not (((b4.is_a? Point)) and b4.x == -1.5 and b4.y == 0.5)
    puts "Line intersect not working properly"
end
verticalLine1 = VerticalLine.new(ONE)
b5 = verticalLine1.intersect(b)
if not (((b5.is_a? Point)) and b5.x == 1 and b5.y == 8)
	puts "Line intersect VerticalLine not working properly"
end
lineSegment1 = LineSegment.new(-THREE, -SIX, ONE,TWO)
b6 = lineSegment1.intersect(b)
if not (b6.is_a? NoPoints)
	puts "Line intersect LineSegment not working properly 1"
end
lineSegment2 = LineSegment.new(ZERO, FIVE, ONE, EIGHT)
b7 = lineSegment2.intersect(b)
if not (((b7.is_a? LineSegment)) and b7.x1 == ZERO and b7.y1 == FIVE and b7.x2 == ONE and b7.y2 == EIGHT)
	puts "Line intersect LineSegment not working properly 2"
end
lineSegment3 = LineSegment.new(ZERO, THREE, ONE, SIX)
b8 = lineSegment3.intersect(b)
if not (b8.is_a? NoPoints)
	puts "Line intersect LineSegment not working properly 3"
end

#VerticalLine Tests
c = VerticalLine.new(THREE)
if not (c.x == THREE)
    puts "VerticalLine not initialized properly"
end

if not (c.eval_prog([]) == c)
    puts "VerticalLine eval_prog should return self"
end
if not (c.preprocess_prog == c)
    puts "VerticalLine preprocess_prog should return self"
end
c1 = c.shift(THREE,FIVE)
if not (c1.x == SIX)
    puts "VerticalLine shift not working properly"
end
c2 = c.intersect(VerticalLine.new(THREE))
if not ((c2.is_a? VerticalLine) and c2.x == THREE )
    puts "VerticalLine intersect not working properly 1"
end
c3 = c.intersect(VerticalLine.new(FOUR))
if not ((c3.is_a? NoPoints))
    puts "VerticalLine intersect not working properly 2"
end
c4 = c.intersect(Point.new(3, 3))
if not (c4.x == THREE and c4.y == THREE)
	puts "VerticalLine intersect Point not working properly 1"
end
c5 = c.intersect(Point.new(5, 5))
if not (c5.is_a? NoPoints)
	puts "VerticalLine intersect Point not working properly 2"
end
c6 = c.intersect(Line.new(3, 5))
if not (c6.x == THREE and c6.y == 14)
	puts "VerticalLine intersect Line not working properly"
end
lineSegment1 = LineSegment.new(-THREE, -SIX, ONE,TWO)
c7 = lineSegment1.intersect(c)
if not (c7.is_a? NoPoints)
	puts "VerticalLine intersect LineSegment not working properly 1"
end
lineSegment2 = LineSegment.new(ZERO, FIVE, FIVE, FIVE)
c8 = lineSegment2.intersect(c)
if not (((c8.is_a? Point)) and c8.x == THREE and c8.y == FIVE)
	puts "VerticalLine intersect LineSegment not working properly 2"
end
lineSegment3 = LineSegment.new(THREE, THREE, THREE, SIX)
c9 = lineSegment3.intersect(c)
if not (((c9.is_a? LineSegment)) and c9.x1 == THREE and c9.y1 == THREE and c9.x2 == THREE and c9.y2 == SIX)
	puts "VerticalLine intersect LineSegment not working properly 3"
end
lineSegment4 = LineSegment.new(FOUR, THREE, FOUR, SIX)
c10 = lineSegment4.intersect(c)
if not (c10.is_a? NoPoints)
	puts "VerticalLine intersect LineSegment not working properly 4"
end


#LineSegment Tests
d = LineSegment.new(ONE,TWO,-THREE,-FOUR)
if not (d.eval_prog([]) == d)
    puts "LineSegement eval_prog should return self"
end
d1 = LineSegment.new(ONE,TWO,ONE,TWO)
d2 = d1.preprocess_prog
if not ((d2.is_a? Point)and d2.x == ONE and d2.y == TWO)
    puts "LineSegment preprocess_prog should convert to a Point"
    puts "if ends of segment are real_close"
end

d = d.preprocess_prog
if not (d.x1 == -THREE and d.y1 == -FOUR and d.x2 == ONE and d.y2 == TWO)
    puts "LineSegment preprocess_prog should make x1 and y1"
    puts "on the left of x2 and y2"
end

d3 = d.shift(THREE,FIVE)
if not (d3.x1 == ZERO and d3.y1 == ONE and d3.x2 == FOUR and d3.y2 == SEVEN)
    puts "LineSegment shift not working properly"
end

d4 = d.intersect(LineSegment.new(-THREE,-FOUR,ONE,TWO))
if not (((d4.is_a? LineSegment)) and d4.x1 == -THREE and d4.y1 == -FOUR and d4.x2 == ONE and d4.y2 == TWO)
    puts "LineSegment intersect not working properly"
end
d5 = d.intersect(LineSegment.new(TWO,THREE,FOUR,FIVE))
if not ((d5.is_a? NoPoints))
    puts "LineSegment intersect not working properly"
end
d6 = d.intersect(LineSegment.new(0, 0.5, 3, 5))
if not (((d6.is_a? LineSegment)) and d6.x1 == 0 and d6.y1 == 0.5 and d6.x2 == ONE and d6.y2 == TWO)
    puts "LineSegment intersect not working properly"
end

#Intersect Tests
i = Intersect.new(LineSegment.new(-ONE,-TWO,THREE,FOUR), LineSegment.new(THREE,FOUR,-ONE,-TWO))
i1 = i.preprocess_prog.eval_prog([])
if not (i1.x1 == -ONE and i1.y1 == -TWO and i1.x2 == THREE and i1.y2 == FOUR)
    puts "Intersect eval_prog should return the intersect between e1 and e2"
end

#Var Tests
v = Var.new("a")
v1 = v.eval_prog([["a", Point.new(THREE,FIVE)]])
if not ((v1.is_a? Point) and v1.x == THREE and v1.y == FIVE)
    puts "Var eval_prog is not working properly"
end
if not (v1.preprocess_prog == v1)
    puts "Var preprocess_prog should return self"
end

#Let Tests
l = Let.new("a", LineSegment.new(-ONE,-TWO,THREE,FOUR),
             Intersect.new(Var.new("a"),LineSegment.new(THREE,FOUR,-ONE,-TWO)))
l1 = l.preprocess_prog.eval_prog([])
if not (l1.x1 == -ONE and l1.y1 == -TWO and l1.x2 == THREE and l1.y2 == FOUR)
    puts "Let eval_prog should evaluate e2 after adding [s, e1] to the environment"
end
l2 = Let.new("y",Let.new("x",NoPoints.new,NoPoints.new),Var.new("x"))
begin
  l2.preprocess_prog.eval_prog([])
  puts "Should have thrown an exception"
rescue => e
  if e.message != "undefined variable x"
    puts "Wrong exception"
  end
end

#Let Variable Shadowing Test
l2 = Let.new("a", LineSegment.new(-ONE, -TWO, THREE, FOUR),
              Let.new("b", LineSegment.new(THREE,FOUR,-ONE,-TWO), Intersect.new(Var.new("a"),Var.new("b"))))
l2 = l2.preprocess_prog.eval_prog([["a",Point.new(0,0)]])
if not (l2.x1 == -ONE and l2.y1 == -TWO and l2.x2 == THREE and l2.y2 == FOUR)
    puts "Let eval_prog should evaluate e2 after adding [s, e1] to the environment"
end


#Shift Tests
s = Shift.new(THREE,FIVE,LineSegment.new(-ONE,-TWO,THREE,FOUR))
s1 = s.preprocess_prog.eval_prog([])
if not (s1.x1 == TWO and s1.y1 == THREE and s1.x2 == SIX and s1.y2 == 9)
    puts "Shift should shift e by dx and dy"
end



