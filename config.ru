$:.unshift("lib")

require "iye/app"
require "iye/web"

app = Iye::App.new("example")
app.load_translations
app.store.create_missing_keys

run Iye::Web
