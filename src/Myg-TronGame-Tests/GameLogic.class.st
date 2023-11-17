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
			          fromString: '#@  @#'
			          fromPackage: MygTronBoard package) do: [ :each | each configured ]).
]
