Class {
	#name : #MygTronMoveSituationTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

{ #category : #tests }
MygTronMoveSituationTest >> testBasicMoveInformation [

	| board position position2|
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@||||+#'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
		
	position := board player1 position.
	self assert: (board player1 move: CpDirection east).
	"The player has moved!"
	"No check that the player position is correct."
	self
		assert: board player1 position x
		equals: (CpDirection east * position) x.
	self assert: board player1 position x equals: 3.
	self assert: board asciiString equals: '#-@|||+#'.
	
   position2 := board player2 position.
	self assert: (board player2 move: CpDirection west).
	"The player has moved!"
	"Now check that the player position is correct."
	self
		assert: board player2 position x
		equals: (CpDirection west * position2) x.
	self assert: board player2 position x equals: 6.
	self assert: board asciiString equals: '#-@||+-#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1Available [

    | board |
    board := MygTronBoard createWithBoard:
                 ((MygLevelImporter
                      fromString: '#|@||||+#'
                      fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
    self assert: board player1 position x equals: 3.
    self assert: board player1 position y equals: 1
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1BumpingInItsOwnTrail [

	| string manager boardElement player board|
	string := '#||||#
#|||+#
#|||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	board := boardElement board.
	player := board atColumn: 5 atRow: 3 .
	
	board player1 move: CpDirection west.
	self assert: board asciiString equals: '#||||#
#|||+#
#||@-#'.
	self deny: (board player1 move: CpDirection east).
	self assert: player position x equals: 4.
	self assert: board asciiString equals: '#||||#
#|||+#
#||@-#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1BumpingInPlayer2Trail [

	| string manager boardElement player board|
	string := '#||||#
#|||+#
#|||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	board := boardElement board.
	player := board atColumn: 5 atRow: 3 .
	
	board player2 move: CpDirection west.
	self assert: board asciiString equals: '#||||#
#||+-#
#|||@#'.
	self deny: (board player1 move: CpDirection north).
	self assert: player position x equals: 5.
	self assert: board asciiString equals: '#||||#
#||+-#
#|||@#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1BumpingInWall [

	| string manager boardElement player position |
	string := '#+||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	
	player := boardElement board atColumn: 4 atRow: 1 .
	position := boardElement board player1 position.
	self deny: (boardElement board player1 move: CpDirection east).
	self assert: boardElement board player1 position equals: position.
	self assert: player position x equals: 4.
	
	self assert: boardElement board asciiString equals: '#+||@#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1LeavesTrailBehind [

	| string manager boardElement space |
	string := '#@|||+#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#@|||+#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player1 moveEast.
	self assert: boardElement board printString equals: '#-@||+#'.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player1 moveEast.
	self assert: boardElement board printString equals: '#--@|+#'.
	self assert: manager currentMoveCount equals: 2.
	boardElement board player1 moveEast.
	self assert: boardElement board printString equals: '#---@+#'.
	self assert: manager currentMoveCount equals: 3.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1MovingOnCorridor [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@||+#'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	position := board player1 position.
	player := board atColumn: 2 atRow: 1 .
	self assert: (board player1 move: CpDirection east).
	self
		assert: board player1 position x
		equals: (CpDirection east * position) x.
	self
		assert: board player1 position y
		equals: (CpDirection east * position) y.
	self assert: player position x equals: 3.
	self assert: board printString equals: '#-@|+#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer1MovingOnGround [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ +#'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	position := board player1 position.
	player := board atColumn: 2 atRow: 1 .
	self deny: (board player1 move: CpDirection east).
	self
		assert: board player1 position x
		equals: position x.
	self
		assert: board player1 position y
		equals:  position y.
	self assert: player position x equals: 2.
	self assert: board printString equals: '#@ +#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2Available [

    | board |
    board := MygTronBoard createWithBoard:
                 ((MygLevelImporter
                      fromString: '#|@||||+#'
                      fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
    self assert: board player2 position x equals: 8.
    self assert: board player2 position y equals: 1
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2BumpingInItsOwnTrail [

	| string manager boardElement player board|
	string := '#||||#
#|||+#
#|||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	board := boardElement board.
	player := board atColumn: 5 atRow: 2 .
	
	board player2 move: CpDirection west.
	self assert: board asciiString equals: '#||||#
#||+-#
#|||@#'.
	self deny: (board player2 move: CpDirection east).
	self assert: player position x equals: 4.
	self assert: board asciiString equals: '#||||#
#||+-#
#|||@#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2BumpingInPlayer1Trail [

	| string manager boardElement player board|
	string := '#||||#
#|||+#
#|||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	board := boardElement board.
	player := board atColumn: 5 atRow: 2 .
	
	board player1 move: CpDirection west.
	self assert: board asciiString equals: '#||||#
#|||+#
#||@-#'.
	self deny: (board player2 move: CpDirection south).
	self assert: player position x equals: 5.
	self assert: board asciiString equals:'#||||#
#|||+#
#||@-#'.
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2BumpingInWall [

		| string manager boardElement player position |
	string := '#+||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	
	player := boardElement board atColumn: 2 atRow: 1 .
	position := boardElement board player2 position.
	self deny: (boardElement board player2 move: CpDirection west).
	self assert: boardElement board player2 position equals: position.
	self assert: player position x equals: 2.
	self assert: boardElement board asciiString equals: '#+||@#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2LeavesTrailBehind [

	| string manager boardElement space |
	string := '#+|||@#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#+|||@#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player2 moveEast.
	self assert: boardElement board printString equals: '#-+||@#'.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player2 moveEast.
	self assert: boardElement board printString equals: '#--+|@#'.
	self assert: manager currentMoveCount equals: 2.
	boardElement board player2 moveEast.
	self assert: boardElement board printString equals: '#---+@#'.
	self assert: manager currentMoveCount equals: 3.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2MovingOnCorridor [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@||+#'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	position := board player2 position.
	player := board atColumn: 5 atRow: 1 .
	self assert: (board player2 move: CpDirection west).
	self
		assert: board player2 position x
		equals: (CpDirection west * position) x.
	self
		assert: board player2 position y
		equals: (CpDirection west * position) y.
	self assert: player position x equals: 4.
	self assert: board printString equals: '#@|+-#'
]

{ #category : #tests }
MygTronMoveSituationTest >> testPlayer2MovingOnGround [

	| board position player |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ +#'
			           fromPackage: MygTronBoard package) do: [ :each |
			          each configured ]).
	position := board player2 position.
	player := board atColumn: 4 atRow: 1 .
	self deny: (board player2 move: CpDirection west).
	self
		assert: board player2 position x
		equals: position x.
	self
		assert: board player2 position y
		equals:  position y.
	self assert: player position x equals: 4.
	self assert: board printString equals: '#@ +#'
]
