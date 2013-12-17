require 'debugger'

class Cell
	attr_accessor :world, :x, :y, :alive

	def initialize(world,x=5,y=5)
		@world = world
		@alive = true
		@x = x
		@y = y
		world.cells << self
	end

	def die!
		@alive = false
	end

	def dead?
		!@alive
	end

	def alive?
		@alive
	end

	def born!
		@alive = true
	end

	def neighbors
		@neighbors = [] #add neighbors to array when we find them
		world.cells.each do |cell|
			#cell to the north
			if cell.alive?
				if self.x == cell.x && self.y == cell.y - 1 #check one cell lower
					@neighbors << cell
				end
				#cell to northeast
				if self.x == cell.x - 1 && self.y == cell.y - 1
					@neighbors << cell
				end
				#cell to the east
				if self.x == cell.x - 1 && self.y == cell.y
					@neighbors << cell
				end
				#cell to the southeast
				if self.x == cell.x - 1 && self.y == cell.y + 1
				 	@neighbors << cell
				end
				#cell to the south
				if self.x == cell.x && self.y == cell.y + 1
				 	@neighbors << cell
				end 
				#cell to southwest
				if self.x == cell.x + 1 && self.y == cell.y + 1
				 	@neighbors << cell
				end 
				#cell to the west
				if self.x == cell.x + 1 && self.y == cell.y
					@neighbors << cell
				end
				#cell to the northwest
				if self.x == cell.x + 1 && self.y == cell.y - 1
					@neighbors << cell
				end
			end
			
		end
		@neighbors
	end

	def spawn_at(x_pos,y_pos)
		world.board[x_pos][y_pos].alive = true
		world.board[x_pos][y_pos]
	end

end