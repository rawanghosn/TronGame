Class {
	#name : #MygTronGameManagerTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

{ #category : #tests }
MygTronGameManagerTest >> testIsBoardReset [

	| string manager boardElement space|
	string := '#########################
#||||||||||||||||||||||@#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#+ | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#########################'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: 
'#########################
#||||||||||||||||||||||@#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#+ | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#########################'.
	boardElement board player1 moveWest.
	self assert: boardElement board printString equals: 
'#########################
#|||||||||||||||||||||@-#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#+ | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#########################'.
	boardElement eventDispatcher handlers first handleEvent:
		(KeyboardEvent new key: KeyboardKey space).
	boardElement := manager currentBoardElement.
	self assert: boardElement board printString equals:
'#########################
#||||||||||||||||||||||@#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#+ | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#########################'.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]

{ #category : #'as yet unclassified' }
MygTronGameManagerTest >> testMoveCountPlayer1 [

	| string manager boardElement space |
	string := '#+||@||#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#+||@||#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player1 moveWest.
	self assert: boardElement board printString equals: '#+|@-||#'.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player1 moveWest.
	self assert: boardElement board printString equals: '#+@--||#'.
	self assert: manager currentMoveCount equals: 2.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]

{ #category : #tests }
MygTronGameManagerTest >> testMoveCountPlayer2 [

	| string manager boardElement space |
	string := '#+||@||#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#+||@||#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player2 moveEast.
	self assert: boardElement board printString equals: '#-+|@||#'.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player2 moveEast.
	self assert: boardElement board printString equals: '#--+@||#'.
	self assert: manager currentMoveCount equals: 2.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]
