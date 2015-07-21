module Solution
	module Command
		class Right < Base
			def do(params = {}) 
				@solution.toy.face = Solution::Toy::FACES[face_index(-1)]
			end
		end
	end
end