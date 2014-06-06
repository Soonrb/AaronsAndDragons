# encoding: utf-8

class Player

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
end