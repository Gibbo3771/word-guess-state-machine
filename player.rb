class Player
   
    attr_reader :name
    def initialize(name)
        @name = name
        @lifes = 6
    end

    def has_lifes?
        return @lifes > 0
    end

    def get_total_lifes
        return @lifes
    end
    
    def decrease_lifes
        @lifes -= 1
    end

end