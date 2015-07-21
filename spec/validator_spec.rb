require 'spec_helper' 

describe Solution::Validator do 
  let(:validator) { Solution::Validator.new(Solution::Processor.new(Solution::Table.new), false) }
  
  context ".valid_command?" do

    context "unexpected_command" do
      subject { validator.valid_command?(Solution::UserInput.new("unexpected_command")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <unexpected_command> not found" }
    end

    context "unexpected command (Place)" do 
      subject { validator.valid_command?(Solution::UserInput.new("Place")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <Place> not found" }
    end

    context "unexpected command (place)" do 
      subject { validator.valid_command?(Solution::UserInput.new("place")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <place> not found" }

    end

    context "unexpected command (Move)" do
      subject { validator.valid_command?(Solution::UserInput.new("Move")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <Move> not found" }
    end

    context "unexpected command (move)" do
      subject { validator.valid_command?(Solution::UserInput.new("move")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <move> not found" }

    end

    context "unexpected command (Left)" do 
      subject { validator.valid_command?(Solution::UserInput.new("Left")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <Left> not found" }
    end

    context "unexpected command (left)" do
      subject { validator.valid_command?(Solution::UserInput.new("left")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <left> not found" }
    end

    context "unexpected command (Right)" do 
      subject { validator.valid_command?(Solution::UserInput.new("Right")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <Right> not found" }

    end

    context "unexpected command (right)" do
      subject { validator.valid_command?(Solution::UserInput.new("right")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <right> not found" }

    end

    context "unexpected command (Report)" do 
      subject { validator.valid_command?(Solution::UserInput.new("Report")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <Report> not found" }

    end

    context "unexpected command (report)" do 
      subject { validator.valid_command?(Solution::UserInput.new("report")) }

      it { expect { subject }.to raise_error Solution::Exceptions::CommandNotFound, "Command <report> not found" }

    end

    context "PLACE" do 
    	subject { validator.valid_command?(Solution::UserInput.new("PLACE")) }
    	it { expect(subject).to be_truthy }
  	end

  	context "MOVE" do 
    	subject { validator.valid_command?(Solution::UserInput.new("MOVE")) }
    	it { expect(subject).to be_truthy }
  	end

  	context "LEFT" do 
    	subject { validator.valid_command?(Solution::UserInput.new("LEFT")) }
    	it { expect(subject).to be_truthy }
  	end
  	
  	context "RIGHT" do 
    	subject { validator.valid_command?(Solution::UserInput.new("RIGHT")) }
    	it { expect(subject).to be_truthy }
  	end
  	
  	context "REPORT" do 
    	subject { validator.valid_command?(Solution::UserInput.new("REPORT")) }
    	it { expect(subject).to be_truthy }
  	end
  	
  end

  context ".valid_params?" do
  	context "PLACE" do 
  		context "correct params" do
  			subject { validator.valid_params?(Solution::UserInput.new("PLACE 0,5,SOUTH")) }
  			it { expect(subject).to be_truthy }
  		end

  		context "incorrect X param" do
  			subject { validator.valid_params?(Solution::UserInput.new("PLACE X,5,SOUTH")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameterValue, "Wrong parameter value [0]=X. Should be a number" }
  		end

  		context "incorret Y param" do
  			subject { validator.valid_params?(Solution::UserInput.new("PLACE 0,Y,SOUTH")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameterValue, "Wrong parameter value [1]=Y. Should be a number" }
  		end

		context "incorret FACE param" do
  			subject { validator.valid_params?(Solution::UserInput.new("PLACE 0,5,FACE")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameterValue, "Wrong parameter value [2]=FACE. Should be a NORTH, EAST, SOUTH or WEST" }
  		end

  		context "incorret params" do
  			subject { validator.valid_params?(Solution::UserInput.new("PLACE X,Y,FACE")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameterValue, 
  			"Wrong parameter value [0]=X. Should be a number; Wrong parameter value [1]=Y. Should be a number; Wrong parameter value [2]=FACE. Should be a NORTH, EAST, SOUTH or WEST" }
  		end
  	end

  	context "MOVE" do 
  		context "correct params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("MOVE")) }
  			it { expect(subject).to be_truthy }
  		end

  		context "incorret params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("MOVE PARAM1")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameters }
  		end
  	end

	context "LEFT" do 
  		context "correct params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("LEFT")) }
  			it { expect(subject).to be_truthy }
  		end

  		context "incorret params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("LEFT PARAM1")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameters }
  		end
  	end

  	context "RIGHT" do 
  		context "correct params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("RIGHT")) }
  			it { expect(subject).to be_truthy }
  		end

  		context "incorret params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("RIGHT PARAM1")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameters }
  		end
  	end

  	context "REPORT" do 
  		context "correct params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("REPORT")) }
  			it { expect(subject).to be_truthy }
  		end

  		context "incorret params" do 
  			subject { validator.valid_params?(Solution::UserInput.new("REPORT PARAM1")) }
  			it { expect{subject}.to raise_error Solution::Exceptions::WrongParameters }
  		end
  	end
  
  end

  context ".to_system_value" do
  	subject { validator.to_system_value("PLACE") }
  	it { expect(subject).to eq :place }
  end

  context "checking the first command" do
  	let(:validator) { Solution::Validator.new(Solution::Processor.new(Solution::Table.new()))}

  	context "correct commands order" do
	  	subject { validator.valid_command?(Solution::UserInput.new("PLACE 0,5,SOUTH")) }
	  	it { expect(subject).to be_truthy }
	end

	context "correct commands order but incorrect params" do
		subject { validator.valid?(Solution::UserInput.new("PLACE X,5,NORTH"))}
		it do 
			expect{subject}.to raise_error Solution::Exceptions::WrongParameterValue
			expect(validator.instance_variable_get(:@init_command)).to be_truthy
		end
	end

	context "incorrect commands order" do 
		subject { validator.valid_command?(Solution::UserInput.new("REPORT"))}
		it { expect {subject}.to raise_error Solution::Exceptions::WrongInitCommand, "Wrong init command <REPORT>. Should be <PLACE X,Y,FACE>"}
	end
  end
end