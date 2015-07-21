require 'spec_helper'

describe Solution::Robot::Cli do

  context "Correct examples" do 
    let(:file1) { File.expand_path('../../examples/example1.txt', __FILE__) }
    let(:file2) { File.expand_path('../../examples/example2.txt', __FILE__) }
    let(:file3) { File.expand_path('../../examples/example3.txt', __FILE__) }
  
    context "Example 1" do

      before do
        $stdin = StringIO.new(File.read(file1))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("0,1,NORTH\n").to_stdout }
    end

    context "Example 2" do

      before do
        $stdin = StringIO.new(File.read(file2))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("0,0,WEST\n").to_stdout }
    end

    context "Example 3" do

      before do
        $stdin = StringIO.new(File.read(file3))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("3,3,NORTH\n").to_stdout }
    end
  end

  context "Incorrect examples" do
    let(:file1) { File.expand_path('../../examples/incorrect.example1.txt', __FILE__) }
    let(:file2) { File.expand_path('../../examples/incorrect.example2.txt', __FILE__) }
    let(:file3) { File.expand_path('../../examples/incorrect.example3.txt', __FILE__) }

    context "Example 1" do
      before do
        $stdin = StringIO.new(File.read(file1))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("Wrong init command <MOVE>. Should be <PLACE X,Y,FACE>\n0,0,SOUTH\n").to_stdout }
    end

    context "Example 2" do 
      before do
        $stdin = StringIO.new(File.read(file2))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("0,1,SOUTH\nCommand <left> not found\n").to_stdout }
    end
    
    context "Example 3" do 
      before do
        $stdin = StringIO.new(File.read(file3))
      end

      subject { Solution::Robot::Cli.start }

      it { expect{subject}.to output("Wrong parameter value [2]=SOUTH2. Should be a NORTH, EAST, SOUTH or WEST\n0,1,SOUTH\n").to_stdout }
    end

  end


end