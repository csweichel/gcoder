require 'rspec'
require 'spec_helper'

describe 'GCode parser' do

  before do
    @parser = GCoder::Parser.new
  end

  it 'should return a GCode program' do
    @parser.parse("G0 X0 Y0 Z0 F1").should be_an_instance_of GCoder::GCode::Program
  end

  it 'should parse rapid motion GCode' do
    cmd = @parser.parse("G0 X1 Y22.22 Z33.3 F12").first

    cmd.should be_an_instance_of GCoder::GCode::MoveRapid
    cmd.feedrate.should eq 12
    cmd.position.should eq [ 1, 22.22, 33.3 ]
  end

  it 'should parse feedrate motion GCode' do
    cmd = @parser.parse("G1 X1 Y22.22 Z33.3 F12").first

    cmd.should be_an_instance_of GCoder::GCode::MoveByFeedrate
    cmd.feedrate.should eq 12
    cmd.position.should eq [ 1, 22.22, 33.3 ]
  end

  it 'should omit empty lines' do
    prog = @parser.parse("""
G0 X1 Y2 Z3

M0
""")
    prog.length.should eq 2
  end

  it 'should parse comments' do
    comments = [
        "Hello World, this is a comment",
        "Let's try another comment"
    ]

    prog = @parser.parse(comments.map {|c| "(#{c})\n" }.join("\n"))

    prog.length.should eq comments.length
    prog.each_with_index do |cmd, idx|
      cmd.should be_an_instance_of GCoder::GCode::Comment
      cmd.text.should eq comments[idx]
    end
  end

end