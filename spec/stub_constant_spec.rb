require "spec_helper"

describe StubConstant do
  it "has a version number" do
    expect(StubConstant::VERSION).not_to be nil
  end

  it "stubs classes" do
    expect { Dog }.to raise_error(NameError)
    StubConstant.klass(:Dog)
    expect { Dog }.to_not raise_error
    expect(Dog.class).to eq Class
  end

  it "stubs modules" do
    expect { Walkable }.to raise_error NameError
    StubConstant.module(:Walkable)
    expect { Walkable }.to_not raise_error
    expect(Walkable.class).to eq Module
  end
end
