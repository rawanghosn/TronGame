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
