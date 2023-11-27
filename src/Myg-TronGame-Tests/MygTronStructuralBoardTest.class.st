Class {
	#name : #MygTronStructuralBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

{ #category : #tests }
MygTronStructuralBoardTest >> testPlayerAvailable [ 
 | board |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '# @    #'
			          fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
	self assert: board player position x equals: 3.
	self assert: board player position y equals: 1
]

{ #category : #tests }
MygTronStructuralBoardTest >> testPrintOnOneLine [

	| board |
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  #'
			          fromPackage: MygTronBoard package) collect: [ :each | each configured ]).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board asciiString equals: '#@  #'
]

{ #category : #tests }
MygTronStructuralBoardTest >> testTrailOnChangeDirection [

	| string manager boardElement space |
	string := 
'######
 #||||#
 #||||#
 #||@|#
 #####'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: 	
'###### 
 #||||#
 #||||#
 #||@|#
 ##### '.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player moveNorth.
	self assert: boardElement board printString equals: 
'###### 
 #||||#
 #||@|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 1.
	boardElement board player moveNorth.
	self assert: boardElement board printString equals: 
'###### 
 #||@|#
 #||-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 2.
   	boardElement board player moveWest.
	self assert: boardElement board printString equals: 
'###### 
 #|@-|#
 #||-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 3.
	boardElement board player moveWest.
	self assert: boardElement board printString equals: 
'###### 
 #@--|#
 #||-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 4.
	boardElement board player moveSouth.
	self assert: boardElement board printString equals: 
'###### 
 #---|#
 #@|-|#
 #||-|#
 ##### '.
	self assert: manager currentMoveCount equals: 5.
	space := manager currentBoardElement space.
	space universe closeSpaceSynchronously: space
]
