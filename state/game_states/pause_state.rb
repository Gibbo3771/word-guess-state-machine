require_relative('../state')
require 'date'

class PauseState < State

    def initialize(duration, next_state)
        @duration = duration
        @next_state = next_state
        @start_time = Date.now.strftime('%Q')
    end

    def update(state_manager, game)
        return if @start_time - Date.now.strftime('%Q') < @duration
        state_manager.change_state(@next_state)
    end

end