
module GCoder

  module Dialects

    def self.default
      map = {}
      map[:C] = {}
      map[:G] = {}
      map[:M] = {}
      map[:G][0] = :MoveRapid
      map[:G][1] = :MoveByAFeedrate
      map[:G][2] = :ClockwiseCircularArcAtFeedrate
      map[:G][3] = :CounterClockwiseCircularArcAtFeedrate
      map[:G][4] = :Dwell
      map[:G][9] = :ExactStopCheck
      map[:G][10] = :ProgrammableParameterInput
      map[:G][15] = :TurnPolarCoordinatesOffReturnToCartesianCoordinates
      map[:G][16] = :TurnPolarCoordinatesOn
      map[:G][17] = :SelectXYPlane
      map[:G][18] = :SelectXZPlane
      map[:G][19] = :SelectYZPlane
      map[:G][20] = :ProgramCoordinatesAreInches
      map[:G][21] = :ProgramCoordinatesAreMm
      map[:G][27] = :ReferencePointReturnCheck
      map[:G][28] = :ReturnToHomePosition
      map[:G][29] = :ReturnFromTheReferencePosition
      map[:G][30] = :ReturnToThe2nd3rdAnd4thReferencePoint
      map[:G][32] = :ConstantLeadThreading
      map[:G][40] = :ToolCutterCompensationOff
      map[:G][41] = :ToolCutterCompensationLeft
      map[:G][42] = :ToolCutterCompensationRight
      map[:G][43] = :ApplyToolLengthCompensationPlus
      map[:G][44] = :ApplyToolLengthCompensationMinus
      map[:G][49] = :ToolLengthCompensationCancel
      map[:G][50] = :ResetAllScaleFactorsTo10
      map[:G][51] = :TurnOnScaleFactors
      map[:G][52] = :LocalWorkshiftForAllCoordinateSystemsAddXyzOffsets
      map[:G][53] = :MachineCoordinateSystem
      map[:G][54] = :WorkCoordinateSystem1stWorkpiece
      map[:G][55] = :WorkCoordinateSystem2ndWorkpiece
      map[:G][56] = :WorkCoordinateSystem3rdWorkpiece
      map[:G][57] = :WorkCoordinateSystem4thWorkpiece
      map[:G][58] = :WorkCoordinateSystem5thWorkpiece
      map[:G][59] = :WorkCoordinateSystem6thWorkpiece
      map[:G][61] = :ExactStopCheckMode
      map[:G][62] = :AutomaticCornerOverride
      map[:G][63] = :TappingMode
      map[:G][64] = :BestSpeedPath
      map[:G][65] = :CustomMacroSimpleCall
      map[:G][68] = :CoordinateSystemRotation
      map[:G][69] = :CancelCoordinateSystemRotation
      map[:G][73] = :HighSpeedDrillingCyclesmallRetract
      map[:G][74] = :LeftHandTappingCycle
      map[:G][76] = :FineBoringCyle
      map[:G][80] = :CancelCannedCycle
      map[:G][81] = :SimpleDrillingCycle
      map[:G][82] = :DrillingCycleWithDwellcounterboring
      map[:G][83] = :PeckDrillingCyclefullRetract
      map[:G][84] = :TappingCycle
      map[:G][85] = :BoringCannedCycleNoDwellFeedOut
      map[:G][86] = :BoringCannedCycleSpindleStopRapidOut
      map[:G][87] = :BackBoringCannedCycle
      map[:G][88] = :BoringCannedCycleSpindleStopManualOut
      map[:G][89] = :BoringCannedCycleDwellFeedOut
      map[:G][90] = :AbsoluteProgrammingOfXYZ
      map[:G][901] = :AbsoluteProgrammingIjktypeBAndCSystems
      map[:G][91] = :IncrementalProgrammingOfXyztypeBAndCSystems
      map[:G][911] = :IncrementalProgrammingIjktypeBAndCSystems
      map[:G][92] = :OffsetCoordinateSystemAndSaveParameters
      map[:G][921] = :CancelOffsetAndZeroParameters
      map[:G][922] = :CancelOffsetAndRetainParameters
      map[:G][923] = :OffsetCoordinateSystemWithSavedParameters
      map[:G][94] = :UnitsPerMinuteFeedModeUnitsInInchesOrMm
      map[:G][95] = :UnitsPerRevolutionFeedModeUnitsInInchesOrMm
      map[:G][96] = :ConstantSurfaceSpeed
      map[:G][97] = :CancelConstantSurfaceSpeed
      map[:G][98] = :ReturnToInitialZPlaneAfterCannedCycle
      map[:G][99] = :ReturnToInitialRPlaneAfterCannedCycle
      map[:M][0] = :ProgramStop
      map[:M][1] = :OptionalStopOperatorSelectedToEnable
      map[:M][2] = :EndOfProgram
      map[:M][3] = :SpindleOnCwRotation
      map[:M][4] = :SpindleOnCcwRotation
      map[:M][5] = :SpindleStop
      map[:M][6] = :ToolChange
      map[:M][7] = :MistCoolantOn
      map[:M][8] = :FloodCoolantOn
      map[:M][9] = :CoolantOff
      map[:M][30] = :EndOfProgramRewindAndResetModes
      map[:M][98] = :SubprogramCall
      map[:M][99] = :ReturnFromSubprogram
      map
    end

  end

end
