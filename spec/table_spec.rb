require 'spec_helper'

describe Solution::Table do

  context "table with default params" do

    subject { Solution::Table.new }

    it do
      expect(subject.x).to eq [0, 5]
      expect(subject.y).to eq [0, 5]
    end
  end

  context "table with custom params" do
    subject { Solution::Table.new(4, 7) }

    it do
      expect(subject.x).to eq [0, 4]
      expect(subject.y).to eq [0, 7]
    end
  end
end