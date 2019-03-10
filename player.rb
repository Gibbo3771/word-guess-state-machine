class Player
   
    attr_reader :name
    def initialize(name)
        @name = name
        @lifes = 1
    end

    def has_lifes?
        return @lifes >= 0
    end

    def get_current_lifes
        return @lifes < 0 ? 0 : @lifes
    end
    
    def decrease_lifes
        @lifes -= 1
    end

end