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

	super setUp.
	
	board := MygTronBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@|||#'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
]

{ #category : #tests }
MygTronGameLogic >> testMoveSteps [

	"self deny: board isFinished."
	board moveSteps: {
			CpDirection east.
			CpDirection east.
			CpDirection east.
			CpDirection east.
			CpDirection east }.
	self assert: board printString equals: '#---@#'
]
