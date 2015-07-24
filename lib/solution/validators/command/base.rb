module Solution
  module Validators
    module Command
      class Base

        def initialize(validator)
          @validator = validator
          @params = {}
        end

        def valid?(input)
          valid_size?(input) && valid_data_types?(input)
        end

        private
        def valid_size?(input)
          if input.params.size != @params.keys.size
            raise Solution::Exceptions::WrongParameters.new("Wrong number of parameters. Should be #{@params.keys.size}")
          end
          true
        end

        def valid_data_types?(input)
          is_valid = true

          @params.keys.each_with_index do |name, idx|
            result = @params[name].valid?(input.params[idx])
            if result
              input.add_valid_param(name, result)
            else
              @validator.generate_message(idx, input.params[idx], @params[name].type)
              is_valid = false
            end
          end

          is_valid
        end
      end
    end
  end
end