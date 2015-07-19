require 'spec_helper'

describe StubConstant do
  it 'has a version number' do
    expect(StubConstant::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
