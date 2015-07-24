class Solution::Command::Place < Solution::Command::Base

	def do(params = {})
		@x = params[:x]
		@y = params[:y]
		@face = params[:face]

		correct_coordinates!
		init_or_place_toy!
	end

	private
	def correct_coordinates!
		@x = @solution.table.x.last if @x > @solution.table.x.last
		@y = @solution.table.y.last if @y > @solution.table.y.last
	end

	def init_or_place_toy!
		if @solution.toy.nil?
			@solution.toy = Solution::Toy.new(@x, @y, @face)
		else
			@solution.toy.x = @x
			@solution.toy.y =  @y
			@solution.toy.face = @face
		end
	end
end