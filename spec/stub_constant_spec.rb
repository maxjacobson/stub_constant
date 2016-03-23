RSpec.describe StubConstant do
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
    expect { Walkable }.to raise_error(NameError)
    StubConstant.module(:Walkable)
    expect { Walkable }.to_not raise_error
    expect(Walkable.class).to eq Module
  end

  it "stubs values" do
    expect { LIMIT }.to raise_error(NameError)
    StubConstant.value(:LIMIT, 4)
    expect(LIMIT).to eq 4
  end

  it "can stub namespaced constants" do
    expect { Turkey::Duck::Chicken }.to raise_error(NameError)
    StubConstant.klass(:'Turkey::Duck::Chicken')
    expect(Turkey).to be_a Class
    expect(Turkey::Duck).to be_a Class
    expect(Turkey::Duck::Chicken).to be_a Class
  end

  it "can stub namespaced constants of mixed types with a little help" do
    expect { Earth }.to raise_error(NameError)
    StubConstant.module(:Earth)
    StubConstant.klass(:'Earth::Uruguay')
    StubConstant.value(:'Earth::Uruguay::POPULATION', 3.42 * 10**6)
    expect(Earth).to be_a Module
    expect(Earth::Uruguay).to be_a Class
    expect(Earth::Uruguay::POPULATION).to be_a Float
  end
end
