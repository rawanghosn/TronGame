Class {
	#name : #MygTronGameLogic,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-TronGame-Tests'
}

{ #category : #running }
MygTronGameLogic >> setUp [
   	| string manager boardElement|
	super setUp.

	string := '#@||||+#'.
	manager := MygTronGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.
	board := boardElement board.
	
]

{ #category : #tests }
MygTronGameLogic >> testGameEnded [

	self assert: board ended equals: false.
	board moveStepsPlayer1:  {
			CpDirection east.
			CpDirection east.
			CpDirection east.
			CpDirection east.}.
	self assert: board printString equals: '#----@+#'.
	self deny: (board player1 move: CpDirection east). 
	self assert: board printString equals: '#----@+#'.
		self assert: board ended equals: true.
]

{ #category : #tests }
MygTronGameLogic >> testMoveStepsPlayer1 [

	self assert: board ended equals: false.
	board moveStepsPlayer1:  {
			CpDirection east.
			CpDirection east.
			CpDirection east.}.
	self assert: board printString equals: '#---@|+#'
]

{ #category : #tests }
MygTronGameLogic >> testMoveStepsPlayer2 [

	self assert: board ended equals: false.
	board moveStepsPlayer2: {
			CpDirection west.
			CpDirection west.
			CpDirection west.}.
	self assert: board printString equals: '#@|+---#'
]
