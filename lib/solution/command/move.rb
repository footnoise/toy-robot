class Solution::Command::Move < Solution::Command::Base

	def do(params = {})
		case @solution.toy.face
			when :north
				@solution.toy.y += 1 if can_up?(:y)
			when :south
				@solution.toy.y -= 1 if can_down?(:y)
			when :east
				@solution.toy.x += 1 if can_up?(:x)
			when :west
				@solution.toy.x -= 1 if can_down?(:x)
			else
				#do nothing
		end
	end

	private
	def can_up?(axis)
		@solution.toy.send(axis) < @solution.table.send(axis).last
	end

	def can_down?(axis)
		@solution.toy.send(axis) > @solution.table.send(axis).first
	end
end