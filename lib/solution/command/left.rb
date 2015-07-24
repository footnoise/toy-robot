class Solution::Command::Left < Solution::Command::Base
	def do(params = {})
		@solution.toy.face = new_face
	end

	protected
	def new_face
		Solution::Toy::FACES[face_index]
	end
end
