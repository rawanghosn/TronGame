Class {
	#name : #MygTronStructuralBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-TronGame-Tests'
}

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
