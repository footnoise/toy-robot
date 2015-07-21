require 'spec_helper'

describe Solution::Toy do
  context "toy with default params" do
    subject { Solution::Toy.new }
    it { expect(subject.to_s).to eq("0,0,NORTH") }
  end


  context "toy with custom params" do
    subject { Solution::Toy.new(1, 2, :south)}
    it { expect(subject.to_s).to eq("1,2,SOUTH")}
  end

end