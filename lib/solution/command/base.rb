module Solution
	module Command
		class Base
			attr_accessor :solution
		
			def initialize(solution)
				@solution = solution
			end
			
			def do(params = {})
				#put defaut code here
			end

			private

			def face_index(turn = 1)
				idx = Solution::Toy::FACES.index(@solution.toy.face)
				idx = idx - turn
				idx = Solution::Toy::FACES.size - 1 if idx < 0
				idx = 0 if idx >= Solution::Toy::FACES.size
				idx  
			end
		end
	end
end