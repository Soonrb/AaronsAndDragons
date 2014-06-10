# encoding: utf-8

require 'rubygems'
require 'gosu'
load 'level.rb'

class GameWindow < Gosu::Window
    
    attr_accessor :blockSize
    
    def initialize
        super 500, 500, false
        self.caption = "Aarons & Dragons"
        
        @blockSize = 20
    
        @level = Level.new(self)
        
        
        puts @level.w
        puts @level.h
        puts @level.window
    end


    def update
        
    end

    def draw

        @level.draw
    end

    def button_down(id)
        if id == Gosu::KbEscape
            close
        end
    end
end

window = GameWindow.new
window.show