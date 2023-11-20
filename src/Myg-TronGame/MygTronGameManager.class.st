Class {
	#name : #MygTronGameManager,
	#superclass : #Object,
	#instVars : [
		'currentBoardElement',
		'currentMoveCount',
		'menu'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #'as yet unclassified' }
MygTronGameManager class >> importFromString: aString [

	| tmp |	
	tmp := MygLevelImporter fromString: aString  fromPackage: self package.
	tmp := tmp collect: [ :each | each configured ].
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].

	^ tmp
]

{ #category : #accessing }
MygTronGameManager class >> menu: aToMenu [
^ self new menu: aToMenu 
]

{ #category : #accessing }
MygTronGameManager >> currentBoardElement [

	^currentBoardElement
]

{ #category : #accessing }
MygTronGameManager >> currentBoardElement: aTronBoardElement [

	currentBoardElement:= aTronBoardElement 
]

{ #category : #accessing }
MygTronGameManager >> currentMoveCount [

	^currentMoveCount
]

{ #category : #accessing }
MygTronGameManager >> currentMoveCount: aNumber [

	currentMoveCount:= aNumber 
]

{ #category : #initialization }
MygTronGameManager >> initialize [

	super initialize.
	currentMoveCount := 0.
]

{ #category : #'as yet unclassified' }
MygTronGameManager >> launchFromString: aString [

	| board |
	self currentMoveCount: 0.
	self currentBoardElement: MygTronBoardElement new.
	board := MygTronBoard 
					createWithBoard: (self class importFromString: aString ) 
					managedBy: self.
	self currentBoardElement openWithModel: board

]

{ #category : #accessing }
MygTronGameManager >> menu [
^ menu
]

{ #category : #accessing }
MygTronGameManager >> menu: m [
 menu := m
]
