$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "stub_constant"

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.disable_monkey_patching!
  config.order = :random
end
