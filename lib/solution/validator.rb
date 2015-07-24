module Solution
	class Validator
		def initialize(processor, init_command = true)
			@processor = processor
			@commands = @processor.commands.keys.collect(&:to_s).collect(&:upcase)
			@params = {
				place: { 
					x: :number,
					y: :number,
					face: Solution::Toy::FACES.collect(&:to_s).collect(&:upcase)
				}
			}
			@init_command = init_command
		end

		def valid_command?(input)
			raise Solution::Exceptions::CommandNotFound.new("Command <#{input.command}> not found", input.command) unless @commands.include? input.command
			raise Solution::Exceptions::WrongInitCommand.new("Wrong init command <#{input.command}>. Should be <PLACE X,Y,FACE>") if @init_command && to_system_value(input.command) != :place  
			true
		end

    def valid_params?(input)
				errors = []
				allow_params = @params[to_system_value(input.command)] || {}

				raise Solution::Exceptions::WrongParameters.new("Wrong number of parameters. Should be #{allow_params.keys.size}") if input.params.size != allow_params.keys.size

				allow_params.keys.each_with_index do |name, idx|
					if allow_params[name] == :number
						if input.params[idx] =~ /^\d+$/
							input.add_valid_param(name, input.params[idx].to_i)
						else
							errors << generate_message(idx, input.params[idx], allow_params[name])
						end
					end

					if allow_params[name].is_a? Array
						if allow_params[name].include? input.params[idx]
							input.add_valid_param(name, to_system_value(input.params[idx]))
						else
							errors << generate_message(idx, input.params[idx], allow_params[name])
						end
					end
				end

				if errors.empty?
					true
				else
					raise Solution::Exceptions::WrongParameterValue.new(errors.join("; "))
				end
		end

    def valid?(input)
    	result = valid_command?(input) && valid_params?(input)
      @init_command = false if result
      result
		end

    def to_system_value(value)
    	value.downcase.to_sym
    end

    private
      	
    def generate_message(idx, value, values)
    	message = "Wrong parameter value [#{idx}]=#{value}. Should be a "
      		
      if values.is_a? Array
      	message << ([values.slice(0, values.size-1).join(', '), values.last].join(' or '))
      else
      	message << values.to_s
      end

      message
		end
	end
end