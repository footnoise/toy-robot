module Solution
  class Toy
    FACES = [:north, :east, :south, :west]
    DEFAULT_X = 0
    DEFAULT_Y = 0

    attr_accessor :x, :y, :face

    def initialize(x = DEFAULT_X, y = DEFAULT_Y, face = FACES.first)
      @x = x
      @y = y
      @face = face
    end

    def to_s
      [@x, @y, @face].collect(&:to_s).collect(&:upcase).join(',')
    end
  end
end