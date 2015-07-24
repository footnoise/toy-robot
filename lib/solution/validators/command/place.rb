class Solution::Validators::Command::Place < Solution::Validators::Command::Base

  def initialize(validator)
    super(validator)
    @params = {
        x: Solution::Validators::Param::Number.new,
        y: Solution::Validators::Param::Number.new,
        face: Solution::Validators::Param::Faces.new
    }
  end
end