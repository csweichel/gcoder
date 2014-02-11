
module GCoder

  module GCode

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
      def to_s
        "(#{code})"
      end
    end

    class CategoryCommand < Command
    end
    class MotionCommand < Command

      def feedrate
        args[:F]
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
    class MoveByAFeedrate < MotionCommand
    end
    class ClockwiseCircularArcAtFeedrate < MotionCommand
    end
    class CounterCclockwiseCircularArcAtFeedrate < MotionCommand
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