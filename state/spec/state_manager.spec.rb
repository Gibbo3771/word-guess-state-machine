require('minitest/autorun')
require('minitest/rg')
require('../state_manager')

class StateManagerTest < Minitest::Test

    def setup()
        @state_manager = StateManager.new()
    end

end
