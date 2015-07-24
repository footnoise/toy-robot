module Solution
	class Validator
		attr_accessor :errors

		def initialize(processor, init_command = true)
			@processor = processor
			@commands = @processor.commands.keys.collect(&:to_s).collect(&:upcase)
			@params = {
					place: Solution::Validators::Command::Place.new(self),
					default:  Solution::Validators::Command::Default.new(self)
			}
			@init_command = init_command
			@errors = []
		end

		def valid_command?(input)
			if incorrect_command?(input)
				raise Solution::Exceptions::CommandNotFound.new("Command <#{input.command}> not found", input.command)
			end

			if incorrect_command_order?(input)
				raise Solution::Exceptions::WrongInitCommand.new("Wrong init command <#{input.command}>. Should be <PLACE X,Y,FACE>")
			end

			true
		end

    def valid_params?(input)
				@errors = []

				command_validator(input).valid?(input)

				if @errors.empty?
					true
				else
					raise Solution::Exceptions::WrongParameterValue.new(@errors.join("; "))
				end
		end

		def valid?(input)
    	result = valid_command?(input) && valid_params?(input)
      @init_command = false if result
      result
		end

    def generate_message(idx, value, values)
			message = "Wrong parameter value [#{idx}]=#{value}. Should be a "

			if values.is_a? Array
				message << ([values.slice(0, values.size-1).join(', '), values.last].join(' or '))
			else
				message << values.to_s
			end

			message

			@errors << message
		end

		private
		def incorrect_command?(input)
			!(@commands.include? input.command)
		end

		def incorrect_command_order?(input)
			@init_command && (Solution::Processor.to_system_value(input.command) != :place)
		end

		def command_validator(input)
			@params[Solution::Processor.to_system_value(input.command)] || @params[:default]
		end
	end
end