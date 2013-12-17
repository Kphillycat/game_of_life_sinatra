require_relative './cell'
require_relative './world'
require 'debugger'

class Set_up
	attr_accessor :world

	def initialize(world)
		@world = world
	end

	def blinker
		#initialize board with blinker formation
		@world.board[5][5].alive = true
		@world.board[6][5].alive = true
		@world.board[4][5].alive = true
	end

	def toad
		#initialize board with toad formation
		@world.board[4][3].alive = true
		@world.board[4][4].alive = true
		@world.board[4][5].alive = true
		@world.board[5][2].alive = true
		@world.board[5][3].alive = true
		@world.board[5][4].alive = true
	end

	def beacon
		#initialize board with beacon formation
		@world.board[4][3].alive = true
		@world.board[4][4].alive = true
		@world.board[5][3].alive = true
		@world.board[6][6].alive = true
		@world.board[7][5].alive = true
		@world.board[7][6].alive = true
	end

	def pulsar
		@world.board[11][10].alive = true
		@world.board[10][11].alive = true
		@world.board[10][12].alive = true
		@world.board[12][11].alive = true
		@world.board[12][12].alive = true
		@world.board[11][13].alive = true
		@world.board[10][14].alive = true
		@world.board[10][15].alive = true
		@world.board[12][14].alive = true
		@world.board[12][15].alive = true
		@world.board[11][16].alive = true
	end

	def random_formation
		pulsar
		beacon
		rand(1..300).times do
			@world.board[rand(1..20)][rand(1..20)].alive = true
		end
	end
end

# def run(worlds=20)
# 	worlds.times do |x|
# 		puts "World #{x+1}"
# 		@world.display
# 		@world.tick!
# 		#sleep(0.05)
# 	end
# end

# puts "Welcome to the game of life where you control the world."
# puts "Which formation would you like to see? 1 - blinker, 2 - toad, 3 - beacon, 4 - pulsar, r - random"
# user_input = gets.chomp

# #Set up board based on formation user wants to see
# if user_input == "1"
# 	blinker
# elsif user_input == "2"
# 	toad
# elsif user_input == "3"
# 	beacon
# elsif user_input == "4"
# 	pulsar
# elsif user_input == "r"
# 	random_formation
# else
# 	puts "Wrong input. Can not compute!"
# end
# #run the program

# run

	