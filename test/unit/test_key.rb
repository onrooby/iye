# encoding: utf-8

require "test_helper"
require "iye/key"

class TestKey < Minitest::Test
  def setup
    @key = Key.new(name: "session.login")
  end

  def test_category
    assert_equal "session", @key.category
  end

  def test_complete_with_text_for_all_translations
    @key.add_translation Translation.new(name: "da.session.login", text: "Log ind")
    @key.add_translation Translation.new(name: "en.session.login", text: "Sign in")

    assert @key.complete?
  end

  def test_complete_with_no_texts
    @key.add_translation Translation.new(name: "da.session.login")
    @key.add_translation Translation.new(name: "en.session.login")

    assert @key.complete?
  end

  def test_not_complete_without_text_for_some_translations
    @key.add_translation Translation.new(name: "da.session.login", text: "Log ind")
    @key.add_translation Translation.new(name: "en.session.login")

    assert_equal false, @key.complete?
  end

  def testemptycomplete_with_no_texts
    @key.add_translation Translation.new(name: "da.session.login")
    @key.add_translation Translation.new(name: "en.session.login")

    assert @key.empty?
  end
end
