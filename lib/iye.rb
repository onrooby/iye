require 'psych'
require 'yaml'
require 'set'
require 'pathname'

require 'cuba'
require 'cuba/render'

module Iye
  class << self
    attr_accessor :app
  end
end

require_relative 'iye/version'
require_relative 'iye/app'
require_relative 'iye/category'
require_relative 'iye/key'
require_relative 'iye/transformation'
require_relative 'iye/translation'
require_relative 'iye/store'
require_relative 'iye/web'
