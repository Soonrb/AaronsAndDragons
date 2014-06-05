class Shape
    
    attr_accessor :w, :h, :sides, :sidesLengths
    def initialize
        @w = 1
        @h = 1
        @sides = 1
        @sidesLengths = []
    end

    #make an array of the lengths of the sides
    def doSideLengths
        i = 0
        l = rand(0..5)
        until i == @sides
            @sidesLengths.push(l)
            i +=1
        end
    end 
    
end

class Triangle < Shape
    
    def initialize
        @sides = 3
        @w = 2
        @h = 2
        @sidesLengths = Array.new
        self.doSideLengths()
    end
    
end


class Square < Shape

    def initialize
        @sides = 4
        @w = 3
        @h = 3
        @sidesLengths = Array.new
        self.doSideLengths()
    end
    
end

class Circle < Shape
    
    def initialize
        @sides = 0
        @w = 4
        @h = 4
        @sidesLengths = Array.new
        self.doSideLengths()
    end
    
end

t = Triangle.new
s = Square.new
c = Circle.new

puts s.sidesLengths.join(",")
puts t.sidesLengths.join(",")
puts c.sidesLengths.join(",")
puts s.sidesLengths.join(",")















