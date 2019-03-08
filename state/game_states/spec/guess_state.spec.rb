require('minitest/autorun')
require('minitest/rg')
require('../guess_state')

class GuessStateTest < Minitest::Test

    def setup
        @state = GuessState.new(nil, nil)
    end

    def test_enter
        @state.enter()
        assert_equal(true, true)
    end

end