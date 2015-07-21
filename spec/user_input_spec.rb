require 'spec_helper'

describe Solution::UserInput do
	context ".new (w params)" do 
		subject { Solution::UserInput.new("command value1,value2") }
		
		it do
			expect(subject.command).to eq "command"
			expect(subject.params.size).to eq 2
			expect(subject.params).to eq ["value1", "value2"]
		end
	end

	context ".new (w/o params)" do 
		subject { Solution::UserInput.new("command1\n")}
		it do 
			expect(subject.command).to eq "command1"
			expect(subject.params).to eq []
		end
	end
end