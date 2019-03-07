require_relative('../state')

class RenderState < State

    def initialize()
        @render_objects = []
    end

    def enter(state_manager, game)

    end

    def update(state_manager, game)
        for object in @render_objects do
            object.call()
        end
    end

    def exit(state_manager, game)
        @render_objects.clear()
    end

    def add(object)
        @render_objects.push(object)
    end

    def clear()
        system ('clear')
    end

end