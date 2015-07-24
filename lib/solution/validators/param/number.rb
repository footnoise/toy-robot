class Solution::Validators::Param::Number < Solution::Validators::Param::Base

  def valid?(value)
    value.to_i if value =~ /^\d+$/
  end

  def type
    :number
  end
end