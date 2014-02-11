require 'rspec'
require 'spec_helper'

describe 'GCode program' do

  it 'should maintain the correct position (in absolute mode) in map_with_context' do
    program = GCoder::Parser.new.parse("""
G90
G0 X0 Y0 Z0 F140
G1 X42 Y13 Z22.2 F100.001
G0 X11.1 Y0 Z102
M0
""")

    program.map_with_context.last.absolute?.should eq true
    program.map_with_context {|cmd, ctx| ctx.position }.first.should eq [
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
        [ 42, 13, 22.2 ],
        [ 11.1, 0, 102 ]
    ]
  end

  it 'should maintain the correct position (in relative mode) in map_with_context' do
    program = GCoder::Parser.new.parse("""
G91
G0 X0 Y0 Z0 F140
G1 X42 Y13 Z22.2 F100.001
G0 X11.1 Y0 Z102
M0
""")

    program.map_with_context.last.absolute?.should eq false
    program.map_with_context {|cmd, ctx| ctx.position }.first.should eq [
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
        [ 0, 0, 0 ],
        [ 42, 13, 22.2 ],
        [ 53.1, 13, 124.2 ]
    ]
  end

  it 'should maintain the correct feedrate in map_with_context' do
    program = GCoder::Parser.new.parse("""
G90
G0 X0 Y0 Z0 F140
G1 X42 Y13 Z22.2 F100.001
G0 X11.1 Y0 Z102
M0
""")

    program.map_with_context {|cmd, ctx| ctx.feedrate }.first.should eq [ 0, 0, 140, 100.001, 100.001 ]
  end

end