require 'spec_helper'

describe "Solution::Command::*" do

  let(:solution) { Solution::Processor.new(Solution::Table.new, Solution::Toy.new) }

  context "Place" do
    let(:place) { Solution::Command::Place.new(solution) }

    context "correct coordinates" do
      subject do
        place.do({x: 1, y: 2, face: :north})
        place.solution.toy
      end

      it do
        expect(subject.x).to eq 1
        expect(subject.y).to eq 2
        expect(subject.face).to eq :north
      end
    end

    context "incorrect coordinates" do
      subject do
        place.do({x: 6, y: 6, face: :north})
        place.solution.toy
      end

      it do
        expect(subject.x).to eq 5
        expect(subject.y).to eq 5
        expect(subject.face).to eq :north
      end
    end
  end

  context "Left" do
    let(:left) { Solution::Command::Left.new(solution) }

    context do
      subject do
        left.do
        left.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :west
      end
    end

    context do
      subject do
        left.do
        left.do
        left.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :south
      end
    end
  end

  context "Right" do
    let(:right) { Solution::Command::Right.new(solution) }

    context do
      subject do
        right.do
        right.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :east
      end
    end

    context do
      subject do
        2.times { right.do }
        right.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :south
      end
    end

    context do
      subject do
        3.times { right.do }
        right.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :west
      end
    end

    context do
      subject do
        4.times { right.do }
        right.solution.toy
      end

      it do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.face).to eq :north
      end
    end

  end

  context "Move" do
    let(:move) { Solution::Command::Move.new(solution) }
    let(:place) { Solution::Command::Place.new(solution) }

    context "moving inside borders" do
      context "NORTH" do
        subject do
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 1
          expect(subject.face).to eq :north
        end
      end

      context "WEST" do
        subject do
          place.do({x: 1, y: 1, face: :west})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 1
          expect(subject.face).to eq :west
        end
      end

      context "SOUTH" do
        subject do
          place.do({x: 1, y: 1, face: :south})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 1
          expect(subject.y).to eq 0
          expect(subject.face).to eq :south
        end
      end

      context "EAST" do
        subject do
          place.do({x: 1, y: 1, face: :east})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 2
          expect(subject.y).to eq 1
          expect(subject.face).to eq :east
        end
      end
    end

    context "moving outside borders" do
      context "NORTH" do
        subject do
          place.do({x: 1, y: 5, face: :north})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 1
          expect(subject.y).to eq 5
          expect(subject.face).to eq :north
        end
      end

      context "WEST" do
        subject do
          place.do({x: 0, y: 1, face: :west})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 1
          expect(subject.face).to eq :west
        end
      end

      context "SOUTH" do
        subject do
          place.do({x: 1, y: 0, face: :south})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 1
          expect(subject.y).to eq 0
          expect(subject.face).to eq :south
        end
      end

      context "EAST" do
        subject do
          place.do({x: 5, y: 1, face: :east})
          move.do
          move.solution.toy
        end

        it do
          expect(subject.x).to eq 5
          expect(subject.y).to eq 1
          expect(subject.face).to eq :east
        end
      end
    end
  end

  context "Report" do
    let(:report) { Solution::Command::Report.new(solution) }

    it { expect { report.do }.to output("0,0,NORTH\n").to_stdout }
  end
end