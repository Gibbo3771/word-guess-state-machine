require('minitest/autorun')
require('minitest/rg')

require_relative('../word')

class TestWord < Minitest::Test

    def setup
        @word = Word.new("test word")
    end

    def test_get_word__unfiltered
        assert_equal("TEST WORD", @word.word)
    end

    def test_get_word__filtered
        assert_equal("**** ****", @word.filtered)
    end

    def test_revealed__true
        @word.reveal()
        assert_equal(true, @word.fully_revealed?)
    end

    def test_revealed__false
        assert_equal(false, @word.fully_revealed?)
    end

    def test_try_match__found
        @word.try_to_match_and_replace("E")
        assert_equal(true, @word.filtered.include?("E"))
    end

    def test_try_match__not_found
        @word.try_to_match_and_replace("B")
        assert_equal(false, @word.filtered.include?("B"))
    end

end