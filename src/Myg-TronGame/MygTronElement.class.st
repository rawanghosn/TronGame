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
MygTronElement >> isPlayer [ 
	^false
]

{ #category : #move }
MygTronElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]
