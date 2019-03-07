require_relative('./guess_state')
require_relative('../render_states/setup_render_state')
require_relative('./get_input_state')
require_relative('../state')

class SetupState < State

    def initialize(player_name)
        @player_name = player_name
    end

    def enter(state_manager, game)
        game.running = true
        game.player = Player.new(@player_name)
    end

    def update(state_manager, game)
        # state_manager.queue()
        state_manager.change_state(GetInputState.new(-> (word) {validation(word)}, SetupRenderState.new(), SetupRenderState.new()))
    end

    def exit(state_manager, game)

    end

    def validation(word)
        return word.length > 0
    end

end
