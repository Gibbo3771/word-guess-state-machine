require_relative '../state/state'

class SetupState < State

    def pre_enter(state_manager, game)
        game.running = true
        game.player = Player.new(@player_name)
        game.word = Word.new()
    end

    def update(state_manager, game)
        state_manager.change_state(EnterSecretState.new())
        set_exiting()
    end
end
