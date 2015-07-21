module Solution
	module Command
		class Report < Base
			def do(params = {})
				puts @solution.toy
			end
		end
	end
end