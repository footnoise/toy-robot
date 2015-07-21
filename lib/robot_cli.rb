$LOAD_PATH << File.join(File.dirname(__FILE__), "solution")

#base
require 'toy'
require 'table'
require 'processor'
require 'validator'
require 'user_input'

#exceptions
require 'exceptions/wrong_parameters'
require 'exceptions/command_not_found'
require 'exceptions/wrong_parameter_value'
require 'exceptions/wrong_init_command'

#commands
require 'command/base'
require 'command/place'
require 'command/left'
require 'command/right'
require 'command/move'
require 'command/report'

require 'robot/cli'