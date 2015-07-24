module Solution
  class Processor
    attr_accessor :table, :toy, :commands

    def initialize(table, toy = nil)
      @commands = {}
      register_commands

      @table = table
      @toy = toy
      
      @validator = Solution::Validator.new(self)
    end

    def parse_and_run(command_line)
      input = Solution::UserInput.new(command_line)
      run(input) if @validator.valid?(input) 
    end

    def self.to_system_value(value)
      value.downcase.to_sym
    end

    private

    def register(cmd)
      @commands[cmd] = eval("Solution::Command::#{cmd.to_s.capitalize}.new(self)")
    end

    def register_commands
      [:move, :place, :left, :right, :report].each { |cmd| register(cmd)}
    end

    def run(input)
      @commands[self.class.to_system_value(input.command)].do(input.valid_params)
    end
  end
end