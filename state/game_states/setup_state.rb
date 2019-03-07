require_relative('./guess_state')
require_relative('../render_states/setup_render_state')
require_relative('../render_states/guess_render_state')
require_relative('./get_input_state')
require_relative('./guess_state')
require_relative('./validate_secret_word_state')
require_relative('../state')

class SetupState < State

    def initialize(player_name)
        @player_name = player_name
    end

    def enter(state_manager, game)
        game.running = true
        game.player = Player.new(@player_name)
        game.word = Word.new()
    end

    def update(state_manager, game)
        state_manager.change_state(GetInputState.new(ValidateSecretWordState.new(GuessRenderState.new(), SetupRenderState.new())))
    end
end
