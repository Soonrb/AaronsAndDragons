class Level

    attr_accessor :window, :w, :h
    
    def initialize(window)
        @window = window
        @w = @window.width #windows width
        @h = @window.height #windows height
        @block = @window.blockSize
        @pathColor = Gosu::Color.argb(0xff216023) #witchcraft colours = 0xff3e8129 - 0xff = #3e8129 = RRGGBB
        @waterColor = Gosu::Color.argb(0xff2e3e88)
    end

    def makeLevel
        @level = Array.new

        i = 0

        while i < @w/@block

            @level[i] = Array.new

            j = 0

            while j < @h/@block

                random_number = [0, 1].sample

                if random_number == 0
                    @level[i][j] = @pathColor
                else
                    @level[i][j] = @waterColor
                end 
                j += 1

            end
            i += 1
        end
        return @level
    end

    def draw
        @level = makeLevel

        x1 = 0 # top left
        y1 = 0
        
        x2 = @block # bottom left
        y2 = 0
        
        x3 = 0 # top right
        y3 = @block
        
        x4 = @block # bottom right
        y4 = @block

        i = 0

        while i < @h

            j = 0

            @window.draw_quad(
            x1+j,y1+i,@waterColor,
            x2+j,y2+i,@pathColor,
            x3+j,y3+i,@pathColor,
            x4+j,y4+i,@waterColor,
            0)

            while j < @h

                j += @block

                @window.draw_quad(
                x1+j,y1+i,@waterColor,
                x2+j,y2+i,@pathColor,
                x3+j,y3+i,@pathColor,
                x4+j,y4+i,@waterColor,
                0)
                
            end

            i += @block
        end
    end
end