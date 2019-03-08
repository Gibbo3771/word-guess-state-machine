require_relative('./enter_secret_state')
require_relative('../state')

class SetupState < State

    def initialize(player_name)
        @player_name = player_name
    end

    def pre_enter(state_manager, game)
        enter(state_manager, game)
    end

    def enter(state_manager, game)
        super
        game.running = true
        game.player = Player.new(@player_name)
        game.word = Word.new()
    end

    def update(state_manager, game)
        state_manager.change_state(EnterSecretState.new())
        set_exiting()
    end
end
