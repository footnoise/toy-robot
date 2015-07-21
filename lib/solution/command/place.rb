module Solution
	module Command
		class Place < Base
			def do(params = {})
				x = params[:x]
				y = params[:y]
				face = params[:face]

				x = @solution.table.x.last if x > @solution.table.x.last
				y = @solution.table.y.last if y > @solution.table.y.last

				if @solution.toy.nil?
					@solution.toy = Solution::Toy.new(x, y, face)
				else
					@solution.toy.x = x 
					@solution.toy.y =  y
					@solution.toy.face = face
				end

				
			end
		end
	end
end