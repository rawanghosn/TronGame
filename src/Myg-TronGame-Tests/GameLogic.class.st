Class {
	#name : #GameLogic,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-TronGame-Tests'
}

{ #category : #running }
GameLogic >> setUp [

	super setUp.
	
	board := MygTronBoard  configureGrid: 
		         ((MygLevelImporter
			          fromString: '#@  #'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
]

{ #category : #'as yet unclassified' }
GameLogic >> testMoveCount [

| manager|
manager := MygTronGameManager new.
self assert: board printString equals: '#@  #'.
self assert: manager currentMoveCount equals: 0.
]
