Class {
	#name : #MygTronElement,
	#superclass : #MygAbstractBox,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
MygTronElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #move }
MygTronElement >> bringIn: aTronMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."

	| previousPosition |
	previousPosition := aTronMovable position.
	aTronMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aTronMovable from: previousPosition.
	^ true
]

{ #category : #initialization }
MygTronElement >> configured [ 
^self
]

{ #category : #testing }
MygTronElement >> isPlayer1 [
	^false
]

{ #category : #testing }
MygTronElement >> isPlayer2 [
	^false
]

{ #category : #move }
MygTronElement >> moveIn: aNeighbor going: aDirection [
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #printing }
MygTronElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]

{ #category : #'as yet unclassified' }
MygTronElement >> restafterbump: boardEl space: boardElspace board: boardElboard [
	boardEl resetBoard: boardElspace board: boardElboard .
	^ boardEl 
]

{ #category : #accessing }
MygTronElement >> title [
| title |
title := BlElement new background: Color blue .
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Game ended. Press Q to quit or S to restart.' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 25)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
