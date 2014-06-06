# encoding: utf-8

require 'rubygems'
require 'gosu'
load 'level.rb'

class GameWindow < Gosu::Window
    def initialize
        super 500, 500, false
        self.caption = "Aarons & Dragons"
                
        @level = Level.new
        @pathColor = Gosu::Color.argb(0xff0b2217) #witchcraft colours = 0xff3e8129 - 0xff = #3e8129 = RRGGBB
    end


    def update
        
    end

    def draw

        x1 = 0 # top left
        y1 = 0
        
        x2 = 10 # bottom left
        y2 = 0
        
        x3 = 0 # top right
        y3 = 10
        
        x4 = 10 # bottom right
        y4 = 10

        plane_x = [x1, x2, x3, x4]

        plane_y = [y1, y2, y3, y4]

        j = 0

        while j < 500

        while plane_y[0] < 501

          draw_quad(
            plane_x[0]+j,plane_y[0]+j,Gosu::Color.argb(0xff80d5c7),
            plane_x[1]+j,plane_y[1]+j,@pathColor,
            plane_x[2]+j,plane_y[2]+j,@pathColor,
            plane_x[3]+j,plane_y[3]+j,Gosu::Color.argb(0xff80d5c7),
            0)

            plane_y = plane_y.collect! { |c|
            c + 10
            }
        end

        plane_y = [y1, y2, y3, y4]   

          while plane_x[0] < 501

          draw_quad(
            plane_x[0]+j,plane_y[0]+j,Gosu::Color.argb(0xff80d5c7),
            plane_x[1]+j,plane_y[1]+j,@pathColor,
            plane_x[2]+j,plane_y[2]+j,@pathColor,
            plane_x[3]+j,plane_y[3]+j,Gosu::Color.argb(0xff80d5c7),
            0)

            plane_x = plane_x.collect! { |c|
            c + 10
            }
        end

        plane_x = [x1, x2, x3, x4]

        j += 10

        end
    end

    def button_down(id)
        if id == Gosu::KbEscape
            close
        end
    end
end

window = GameWindow.new
window.show