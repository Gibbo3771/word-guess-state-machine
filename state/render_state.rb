require_relative './state'

class RenderState < State

    def initialize(*args)
        super
        @render_objects = []
    end

    def enter(state_manager, game)
        super
    end

    def update(state_manager, game)
        super
        for object in @render_objects do
            object.call()
        end
    end

    def exit(state_manager, game)
        super
        clear_render_objects()
    end

    def add(object)
        @render_objects.push(object)
    end

    def clear_terminal
        system ('clear')
    end

    def clear_render_objects()
        @render_objects.clear()
    end

end