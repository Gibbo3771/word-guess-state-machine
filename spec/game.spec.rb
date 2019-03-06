require('minitest/autorun')
require('minitest/rg')

require_relative('../game')

class TestGame < Minitest::Test

    def setup()
        @game = Game.new()
    end

end
