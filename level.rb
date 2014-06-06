# encoding: utf-8

class Level

    width = 64
    height = 32
    $path = " "
    $abyss = "█"
    $playerChar = 'o'
    position = []
    message = ""

    def new_game(level, w, h)
        startX = rand(0...h)
        startY = rand(0...w)

        start_location,$position = level[startX][startY]
        if start_location == $path
            level[startX][startY] = $playerChar
    		
    		return level, [startX, startY]
    	
        else
            new_game(level, w, h)
        end
    end

    def makeLevel(w,h)
        level = Array.new
        i = 0
        while i < h
            level[i] = Array.new

            j = 0

            while j < w

                random_number = [0, 1].sample

                if random_number == 0
                    level[i][j] = $path
                else
                    level[i][j] = $abyss
                end 

                j += 1
            end
            i += 1
        end
        return level
    end

    def showLevel(level)
        level.each { |x|
            puts x.join("")
        }
    end
end