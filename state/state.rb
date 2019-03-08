class State

    def initialize(*args)

    end

    attr_accessor :exiting
    # Called once whenever you create a state by adding it to the state manager
    def pre_enter(state_manager, game)
        # puts "State : #{self.class}"
        @exiting = false
    end

    # Called once, every time the state manager brings this state back into focus
    def enter(state_manager, game)
    end

    # Called as long as this state is current
    def update(state_manager, game)

    end

    # Called once whenever the state loses focus
    def exit(state_manager, game)
        exiting = true
    end

    # Called once before the object is destroyed
    def destroy(state_manager, game)
    end

    def set_exiting()
        @exiting = true
    end

end