module Iye
  class App
    def initialize path
      @path = File.expand_path(path)
      @store = Store.new
      Iye.app = self
      $stdout.puts " * Loading translations from #{@path}"
      load_translations

      $stdout.puts " * Creating missing translations"
      store.create_missing_keys
    end

    attr_accessor :store

    def load_translations
      files = Dir[@path + "/**/*.yml"]
      files.each {|file|
        yaml = YAML.load_file(file)
        store.from_yaml(yaml, file)
      }
    end

    def save_translations
      files = store.to_yaml
      files.each {|file, yaml|
        File.open(file, "w", encoding: "utf-8") { |f| f << yaml.to_yaml(line_width: -1) }
      }
    end
  end
end
