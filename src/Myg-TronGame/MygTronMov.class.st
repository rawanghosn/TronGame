Class {
	#name : #MygTronMov,
	#superclass : #MygTronElement,
	#classVars : [
		'background',
		'position'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #'as yet unclassified' }
MygTronMov >> addtrail [ 
^ self addtrail.
]

{ #category : #accessing }
MygTronMov >> background [

	^background 
]

{ #category : #accessing }
MygTronMov >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygTronMov >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #initialization }
MygTronMov >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #initialization }
MygTronMov >> defaultBackground [

	^ MygTronGround new
]

{ #category : #accessing }
MygTronMov >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #move }
MygTronMov >> moveEast [

	^ self move: CpDirection east
]

{ #category : #move }
MygTronMov >> moveNorth [ 
	^ self move: CpDirection north
]

{ #category : #move }
MygTronMov >> moveSouth [

	^ self move: CpDirection south
]

{ #category : #move }
MygTronMov >> moveWest [

	^ self move: CpDirection west
]

{ #category : #accessing }
MygTronMov >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
