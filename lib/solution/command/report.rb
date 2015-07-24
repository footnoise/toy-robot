class Solution::Command::Report < Solution::Command::Base

	def do(params = {})
		puts @solution.toy
	end
end
