Class {
	#name : #MygTronWall,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame'
}

{ #category : #'default encoding' }
MygTronWall class >> textualMapCharacter [

	^ $#
]

{ #category : #accessing }
MygTronWall >> backgroundRepresentation [

	^ MygSkBoxElement wallIcon
]
