module Solution
  module Robot
    class Cli
      def self.start
        
        processor = Solution::Processor.new(Solution::Table.new)

        begin
          $stdin.each do |line|
              processor.parse_and_run(line)
          end
          
        rescue  SystemExit, Interrupt
          exit(1)
        rescue Exception => e
          puts e.message
          retry
        end
      end
    end
  end
end