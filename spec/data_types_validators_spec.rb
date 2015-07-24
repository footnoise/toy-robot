require 'spec_helper'

describe "Solution::Validators::*" do
  describe Solution::Validators::Param::Number do
    let(:validator) { Solution::Validators::Param::Number.new }
    context ".valid?" do
      subject { validator }
      it do
        expect(subject.valid?('1234')).to eq 1234
        expect(subject.valid?("qweqwe")).to be_nil
      end
    end

    context ".type" do
      subject { validator.type }
      it { expect(subject).to eq :number }
    end
  end

  describe Solution::Validators::Param::Faces do
    let(:validator) { Solution::Validators::Param::Faces.new }

    context ".valid?" do
      subject { validator }
      it do
        expect(validator.valid?("face")).to be_nil
        expect(validator.valid?("EAST")).to eq :east
      end
    end

    context ".type" do
      subject { validator.type }
      it { expect(subject.size).to eq 4 }
    end
  end

  describe Solution::Validators::Command::Default do
    let(:validator) { Solution::Validators::Command::Default.new(Solution::Validator.new(Solution::Processor.new(nil))) }

    context ".valid?" do
      subject { validator }
      it do
        expect(validator.valid?(Solution::UserInput.new("COMMAND"))).to be_truthy
        expect{validator.valid?(Solution::UserInput.new("PLACE 0,0,EAST"))}.to raise_error Solution::Exceptions::WrongParameters
        expect(validator.instance_variable_get(:@params).size).to eq 0
      end
    end
  end

  describe Solution::Validators::Command::Place do
    let(:validator) { Solution::Validators::Command::Place.new(Solution::Validator.new(Solution::Processor.new(nil))) }

    context ".valid?" do
      subject { validator }
      it do
        expect{validator.valid?(Solution::UserInput.new("COMMAND"))}.to raise_error Solution::Exceptions::WrongParameters
        expect(validator.valid?(Solution::UserInput.new("PLACE 0,0,EAST"))).to be_truthy
        expect(validator.instance_variable_get(:@params).size).to eq 3
      end
    end
  end
end