require_relative('./render_state')


class SetupRenderState < RenderState

    def enter(state_manager, game)
        super(state_manager, game)
        add(-> {
            pretty_print("Enter a secret word:", 0.05)
            print "> "
        })
    end

    def update(state_manager, game)
        clear()
        super(state_manager, game)
        state_manager.change_state(SetupState.new("Stephen"))
    end

end