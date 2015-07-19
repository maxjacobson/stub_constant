require "stub_constant/version"

class StubConstant
  def self.module(full_name)
    new(full_name).stub_with { Module.new }
  end

  def self.klass(full_name)
    new(full_name).stub_with { Class.new }
  end

  def self.value(full_name, value)
    new(full_name).stub_with { value }
  end

  def initialize(full_name)
    @full_name = full_name
  end

  def stub_with(&block)
    full_name.to_s.split(/::/).inject(Object) do |context, name|
      begin
        context.const_get(name)
      rescue NameError
        # Defer substitution of a stub module/class to the last possible
        # moment by overloading const_missing. We use a module here so
        # we can "stack" const_missing definitions for various
        # constants.
        mod = Module.new do
          define_method(:const_missing) do |missing_const_name|
            if missing_const_name.to_s == name.to_s
              value = block.call
              const_set(name, value)
              value
            else
              super(missing_const_name)
            end
          end
        end
        context.extend(mod)
      end
    end
  end

  private

  attr_reader :full_name
end
