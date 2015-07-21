module Solution
	module Command
		class Left < Base
			def do(params = {})
				@solution.toy.face = Solution::Toy::FACES[face_index]
			end
		end
	end
end