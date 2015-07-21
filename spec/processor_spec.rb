require 'spec_helper'

describe Solution::Processor do
  let(:table) { Solution::Table.new }
  let(:toy) { Solution::Toy.new }

  context "correct instance" do

    subject { Solution::Processor.new(table, toy) }

    it do
      expect(subject.table).to eq table
      expect(subject.toy).to eq toy
    end
  end

  context "attach commands" do
    subject { Solution::Processor.new(table, toy).instance_variable_get(:@commands) }

    it do
      expect(subject.size).to eq 5
      expect(subject[:place]).to be_a Solution::Command::Place
      expect(subject[:left]).to be_a Solution::Command::Left
      expect(subject[:right]).to be_a Solution::Command::Right
      expect(subject[:move]).to be_a Solution::Command::Move
      expect(subject[:report]).to be_a Solution::Command::Report

    end
  end
end