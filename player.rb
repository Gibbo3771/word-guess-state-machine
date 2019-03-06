class Player
   
    attr_reader :name
    def initialize(name)
        @name = name
        @turn = false
    end

    def turn?
        return @turn
    end

end