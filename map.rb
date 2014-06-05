
# encoding: utf-8

require 'rubygems'
require 'gosu'

width = 64
height = 32
$path = " "
$abyss = "█"
$playerChar = 'o'
position = []
message = ""

require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new(self, "media/Space.png", true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
end

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

def up(pos,level)
	pos[0] = pos[0] - 1
	level[pos[0]][pos[1]] = $playerChar
	level[pos[0] + 1][pos[1]] = $path		
end

def down(pos,level)
	pos[0] = pos[0] + 1
	level[pos[0]][pos[1]] = $playerChar
	level[pos[0] - 1][pos[1]] = $path	
end

def right(pos,level)
	pos[1] = pos[1] + 1
	level[pos[0]][pos[1]] = $playerChar
	level[pos[0]][pos[1] - 1] = $path
end

def left(pos,level)
	pos[1] = pos[1] - 1
	level[pos[0]][pos[1]] = $playerChar
	level[pos[0]][pos[1] + 1] = $path	
end

level = makeLevel(width,height)
level, position = new_game(level, width, height)
puts position
showLevel(level)
window = GameWindow.new
window.show

until message == "quit" do 
    message = gets.chomp
    
    if(message == "w") and level[position[0] - 1][position[1]] == $path
        puts "You Typed: " + message
			up(position, level)
	elsif(message == "s") and level[position[0] + 1][position[1]] == $path
        	puts "You Typed: " + message
			down(position, level)
	elsif(message == "d") and level[position[0]][position[1] + 1] == $path
        			puts "You Typed: " + message
					right(position, level)
	elsif(message == "a") and level[position[0]][position[1] - 1] == $path
        			puts "You Typed: " + message
					left(position, level)
	elsif (message == "quit")
			break
	else
		puts "You cannot walk through the abyss without a bridge"
	end
	showLevel(level)
end











