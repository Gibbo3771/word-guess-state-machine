class StateManager

    def initialize(game)
        @game = game
        @current_state = nil
        @next_state = nil
        @queue = []
    end

    def update()
        return if @current_state == nil
        @current_state.update(self, @game) if !@current_state.exiting
        # @current_state.exit(self, @game) if @current_state.exiting
    end

    def change_state(new_state)
        return if new_state == nil
        @current_state.exit(self, @game) if @current_state != nil
        @current_state = new_state
        @current_state.enter(self, @game)
    end

    def queue(state)
        @queue.push(state)
    end

    def next_state()
        change_state(@queue.slice!())
    end

end