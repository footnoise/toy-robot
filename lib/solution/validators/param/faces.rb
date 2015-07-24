class Solution::Validators::Param::Faces < Solution::Validators::Param::Base

  def initialize
    @values = Solution::Toy::FACES.collect(&:to_s).collect(&:upcase)
  end

  def valid?(value)
    Solution::Processor.to_system_value(value) if @values.include? value
  end

  def type
    @values
  end
end