class StateManager

    attr_accessor :current_state
    def initialize(game)
        @game = game
        @current_state = nil
        @stack = []
    end

    def update()
        return if @current_state == nil
        if @current_state.exiting
            @current_state.destroy(self, @game)
            @current_state = pop_from_stack()
            @current_state.enter(self, @game) if @current_state != nil
            return
        end
        @current_state.update(self, @game)
    end

    def change_state(new_state)
        add_to_stack(@current_state)
        @current_state.exit(self, @game) if @current_state != nil
        set_state(new_state)
    end

    def set_state(state)
        @current_state = state
        return if state == nil
        @current_state.pre_enter(self, @game)
        @current_state.enter(self, @game)
    end

    def add_to_stack(state)
        return if state == nil
        @stack.push(state)
    end

    def pop_from_stack()
        return @stack.pop()
    end

    def clean_up_states()
        @stack.each { | state | state.exit(self, @game)}
        @stack.clear()
        @current_state = nil
    end

end