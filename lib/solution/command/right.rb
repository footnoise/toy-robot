class Solution::Command::Right < Solution::Command::Left

	protected
	def new_face
		Solution::Toy::FACES[face_index(-1)]
	end
end
