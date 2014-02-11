require 'delegate'

class Object

  #
  # A combination of to_i and to_f.
  # If this object is nil?, nil is returned.
  # If this object is an integer, to_i is returned.
  # If this object is a floating point number, to_f is returned.
  #
  def to_nif
    if nil?
      nil
    elsif to_i.to_s == self
      to_i
    else
      to_f
    end
  end

end

module GCoder

  module GCode

    class ProgramContext < SimpleDelegator
      attr_accessor :position, :feedrate, :units, :absolute

      def initialize(position = [0,0,0], feedrate = 0, units = :mm, absolute = false)
        super({})

        @position = position
        @feedrate = feedrate
        @units = units
        @absolute = absolute
      end

      def absolute?; absolute; end

      def update_position(pos)
        if absolute
          @position = @position.each_with_index.map {|e, i| pos[i] || @position[i] }
        else
          @position = @position.each_with_index.map {|e, i| @position[i] + (pos[i] || 0) }
        end
      end

      def update_feedrate(feedrate)
        @feedrate = feedrate unless feedrate.nil?
      end
    end

    class Program < SimpleDelegator
      include GCoder::GCode

      def initialize(commands)
        super(commands)
      end

      #
      # Interpretes aspects of the GCode program, namely position, feedrate, unit of measure
      # and absolute/incremental positioning. This information is made available to the optional
      # block as second parameter, through a ProgramContext instance.
      #
      # Returns an array with two elements, the mapping result and context.
      #
      #
      def map_with_context(&block)
        ctx = ProgramContext.new

        map_result = self.map do |cmd|
          if block_given?
            r = yield(cmd, ctx)
          else
            r = cmd
          end

          if cmd.is_a? MoveRapid or cmd.is_a? MoveByFeedrate
            ctx.update_position cmd.position
            ctx.update_feedrate cmd.feedrate
          elsif cmd.is_a? ProgramCoordinatesAreMm
            ctx.units = :mm
          elsif cmd.is_a? ProgramCoordinatesAreInches
            ctx.units = :inch
          elsif cmd.is_a? AbsoluteProgrammingOfXYZ
            ctx.absolute = true
          elsif cmd.is_a? IncrementalProgrammingOfXYZ
            ctx.absolute = false
          end

          r
        end

        [map_result, ctx]
      end


    end

    class Command
      attr_reader :code, :args

      def initialize(code, args)
        @code = code
        @args = args
      end

      def to_s
        ( [code] + args.map {|e| e.join } ).join(" ")
      end

    end

    class Comment < Command
      # Returns the text of the comment without the parentheses
      def text
        code
      end

      def to_s
        "(#{code})"
      end
    end

    class CategoryCommand < Command
    end
    class MotionCommand < Command

      def position
        [ args[:X], args[:Y], args[:Z] ].map {|x| x.to_nif }
      end

      def feedrate
        args[:F].to_nif
      end

    end
    class CompensationCommand < Command
    end
    class CoordinateCommand < Command
    end
    class MotionCommand < Command
    end
    class CannedCommand < Command
    end
    class CompensationCommand < Command
    end
    class CoordinateCommand < Command
    end
    class OtherCommand < Command
    end
    class CannedCommand < Command
    end
    class MCodeCommand < Command
    end

    class MoveRapid < MotionCommand
    end
    class MoveByFeedrate < MotionCommand
    end
    class ClockwiseCircularArcAtFeedrate < MotionCommand
    end
    class CounterClockwiseCircularArcAtFeedrate < MotionCommand
    end
    class Dwell < MotionCommand
    end
    class ExactStopCheck < MotionCommand
    end
    class ProgrammableParameterInput < CompensationCommand
    end
    class TurnPolarCoordinatesOffReturnToCartesianCoordinates < CoordinateCommand
    end
    class TurnPolarCoordinatesOn < CoordinateCommand
    end
    class SelectXYPlane < CoordinateCommand
    end
    class SelectXZPlane < CoordinateCommand
    end
    class SelectYZPlane < CoordinateCommand
    end
    class ProgramCoordinatesAreInches < CoordinateCommand
    end
    class ProgramCoordinatesAreMm < CoordinateCommand
    end
    class AbsoluteProgrammingOfXYZ < CoordinateCommand
    end
    class IncrementalProgrammingOfXYZ < CoordinateCommand
    end
    class ReferencePointReturnCheck < MotionCommand
    end
    class ReturnToHomePosition < MotionCommand
    end
    class ReturnFromTheReferencePosition < MotionCommand
    end
    class ReturnToThe2nd3rdAnd4thReferencePoint < MotionCommand
    end
    class ConstantLeadThreading < CannedCommand
    end
    class ToolCutterCompensationOff < CompensationCommand
    end
    class ToolCutterCompensationLeft < CompensationCommand
    end
    class ToolCutterCompensationRight < CompensationCommand
    end
    class ApplyToolLengthCompensationPlus < CompensationCommand
    end
    class ApplyToolLengthCompensationMinus < CompensationCommand
    end
    class ToolLengthCompensationCancel < CompensationCommand
    end
    class ResetAllScaleFactorsTo1 < CompensationCommand
    end
    class TurnOnScaleFactors < CompensationCommand
    end
    class MachineCoordinateSystem < CoordinateCommand
    end
    class WorkCoordinateSystem1stWorkpiece < CoordinateCommand
    end
    class WorkCoordinateSystem2ndWorkpiece < CoordinateCommand
    end
    class WorkCoordinateSystem3rdWorkpiece < CoordinateCommand
    end
    class WorkCoordinateSystem4thWorkpiece < CoordinateCommand
    end
    class WorkCoordinateSystem5thWorkpiece < CoordinateCommand
    end
    class WorkCoordinateSystem6thWorkpiece < CoordinateCommand
    end
    class ExactStopCheckMode < OtherCommand
    end
    class AutomaticCornerOverride < OtherCommand
    end
    class TappingMode < OtherCommand
    end
    class BestSpeedPath < OtherCommand
    end
    class CustomMacroSimpleCall < OtherCommand
    end
    class CoordinateSystemRotation < CoordinateCommand
    end
    class CancelCoordinateSystemRotation < CoordinateCommand
    end
    class HighSpeedDrillingCycle < CannedCommand
    end
    class LeftHandTappingCycle < CannedCommand
    end
    class FineBoringCyle < CannedCommand
    end
    class CancelCannedCycle < CannedCommand
    end
    class SimpleDrillingCycle < CannedCommand
    end
    class DrillingCycleWithDwell < CannedCommand
    end
    class PeckDrillingCycle < CannedCommand
    end
    class TappingCycle < CannedCommand
    end
    class BoringCannedCycleNoDwellFeedOut < CannedCommand
    end
    class BoringCannedCycleSpindleStopRapidOut < CannedCommand
    end
    class BackBoringCannedCycle < CannedCommand
    end
    class BoringCannedCycleSpindleStopManualOut < CannedCommand
    end
    class BoringCannedCycleDwellFeedOut < CannedCommand
    end
    class OffsetCoordinateSystemAndSaveParameters < CoordinateCommand
    end
    class ClampOfMaximumSpindleSpeed < MotionCommand
    end
    class CancelOffsetAndZeroParameters < CoordinateCommand
    end
    class CancelOffsetAndRetainParameters < CoordinateCommand
    end
    class OffsetCoordinateSystemWithSavedParameters < CoordinateCommand
    end
    class UnitsPerMinuteFeedModeUnitsInInchesOrMm < MotionCommand
    end
    class UnitsPerRevolutionFeedModeUnitsInInchesOrMm < MotionCommand
    end
    class ConstantSurfaceSpeed < MotionCommand
    end
    class CancelConstantSurfaceSpeed < MotionCommand
    end
    class ReturnToInitialZPlaneAfterCannedCycle < CannedCommand
    end
    class ReturnToInitialRPlaneAfterCannedCycle < CannedCommand
    end
    class ProgramStop < MCodeCommand
    end
    class ProgramStopOptional < MCodeCommand
    end
    class EndOfProgram < MCodeCommand
    end
    class SpindleOnCwRotation < MCodeCommand
    end
    class SpindleOnCcwRotation < MCodeCommand
    end
    class SpindleStop < MCodeCommand
    end
    class ToolChange < MCodeCommand
    end
    class MistCoolantOn < MCodeCommand
    end
    class FloodCoolantOn < MCodeCommand
    end
    class CoolantOff < MCodeCommand
    end
    class EndOfProgramRewindAndResetModes < MCodeCommand
    end
    class SubprogramCall < MCodeCommand
    end
    class ReturnFromSubprogram < MCodeCommand
    end

  end

end