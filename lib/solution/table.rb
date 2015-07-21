module Solution
  class Table
    attr_accessor :x, :y

    def initialize(width = 5, height = 5)
      @x = [0, width]
      @y = [0, height]
    end
  end
end