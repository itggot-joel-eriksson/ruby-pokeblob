require "csv"

class Triangle
    def initialize(coords:)
        @coords = coords
    end

    def length
        @len_1 = Math.sqrt((@coords[0][0] - @coords[1][0])**2 + (@coords[0][1] - @coords[1][1])**2)
        @len_2 = Math.sqrt((@coords[0][0] - @coords[2][0])**2 + (@coords[0][1] - @coords[2][1])**2)
        @len_3 = Math.sqrt((@coords[1][0] - @coords[2][0])**2 + (@coords[1][1] - @coords[2][1])**2)
        angle
    end

    def angle
        @v = Math.acos(((@len_3**2) - (@len_1**2) - (@len_2**2))/(-2 * @len_1 * @len_2))
        area
    end

    def area
        area = (@len_1 * @len_2 * Math.sin(@v))/2
    end
end

total_area = 0

puts "=" * 20

is_first_run = true

CSV.foreach("input.csv", col_sep: ";") do |line|
    if is_first_run == false
        arr = Array.new
        arr_dup = Array.new(3)

        line.map! { |a| a.to_f }

        arr_dup.each do
            arr << line.pop(2)
        end

        area = Triangle.new(coords: arr).length
        puts "#{area} pixel" unless area != 1.0
        puts "#{area} pixels" unless area == 1.0

        total_area += area
    else
        is_first_run = false
    end
end

puts "=" * 20
puts "#{total_area} pixel" unless total_area != 1.0
puts "#{total_area} pixels" unless total_area == 1.0
puts "=" * 20
