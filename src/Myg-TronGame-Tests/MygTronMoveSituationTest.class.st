Class {
	#name : #MygTronMoveSituationTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

{ #category : #tests }
MygTronMoveSituationTest >> testBasicMoveInformation [

	| board position |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@    #'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
		
	position := board player position.
	self assert: (board player move: CpDirection east).
	"The player has moved!"
	"No check that the player position is correct."
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self assert: board player position x equals: 3.
	self assert: board asciiString equals: '# @   #'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayerBumpingInWall [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#  @#'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	player := board atColumn: 3 atRow: 1 .
	position := board player position.
	self deny: (board player move: CpDirection east).
	self assert: board player position equals: position.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '#  @#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayerMovingOnGround [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ #'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	position := board player position.
	player := board atColumn: 2 atRow: 1 .
	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self
		assert: board player position y
		equals: (CpDirection east * position) y.
	self assert: player position x equals: 3.
	self assert: board printString equals: '# @#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayerMovingTwoTimesOnGroundRestoreCorrectlyGround [

	| board |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  #'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board printString equals: '#@  #'.
	self assert: board printString equals: '#@  #'.
	self assert: board player moveEast.
	self assert: board printString equals: '# @ #'.
	board player moveEast.
	self assert: board printString equals: '#  @#'
]
