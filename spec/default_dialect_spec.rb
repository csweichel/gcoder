require 'rspec'
require 'spec_helper'

describe 'Default dialect' do

  it 'should use only classes that exist in GCoder' do
    GCoder::Dialects::default.values.map {|e| e.values }.flatten.each do |classname|
      GCoder::GCode.const_defined?(classname).should be_true, "Undefined class #{classname}"
      GCoder::GCode.const_get(classname).new("Code", {})
    end
  end

end