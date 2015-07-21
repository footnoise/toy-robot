module Solution
	class UserInput 
		attr_reader :command, :params
		attr_reader :valid_params

		def initialize(command_line)
			@valid_params = {}
			@params  = command_line.split(' ')
			@command = @params.slice!(0)
      @params  = @params.first.split(',') unless @params.first.nil?
		end

		def add_valid_param(key, value)
    	@valid_params[key] = value
		end
	end
end