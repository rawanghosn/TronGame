Class {
	#name : #MygTronStructuralBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

{ #category : #tests }
MygTronStructuralBoardTest >> testPlayersAvailable [

    | board |
    board := MygTronBoard createWithBoard:
                 ((MygLevelImporter
                      fromString: '#+|@||||#'
                      fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
    self assert: board player1 position x equals: 4.
    self assert: board player1 position y equals: 1.
    self assert: board player2 position x equals: 2.
    self assert: board player2 position y equals: 1
]

{ #category : #tests }
MygTronStructuralBoardTest >> testPrintOnOneLine [

	| board |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  +#'
			          fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  +#' size.
	self assert: board asciiString equals: '#@  +#'
]

{ #category : #tests }
MygTronStructuralBoardTest >> testTrail1OnChangeDirection [

	| string manager boardElement space |
	string := 
'######
 #+|||#
 #||||#
 #||@|#
 #####'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: 	
'###### 
 #+|||#
 #||||#
 #||@|#
 ##### '.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player1 moveNorth.
	self assert: boardElement board printString equals: 
'###### 
 #+|||#
 #||@|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player1 moveNorth.
	self assert: boardElement board printString equals: 
'###### 
 #+|@|#
 #||-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 2.
   	boardElement board player1 moveWest.
	self assert: boardElement board printString equals: 
'###### 
 #+@-|#
 #||-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 3.
	boardElement board player1 moveSouth.
	self assert: boardElement board printString equals: 
'###### 
 #+--|#
 #|@-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 4.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]
