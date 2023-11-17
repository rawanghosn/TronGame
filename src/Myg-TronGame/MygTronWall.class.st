Class {
	#name : #MygTronWall,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronWall class >> textualMapCharacter [

	^ $#
]

{ #category : #accessing }
MygTronWall >> backgroundRepresentation [
	^ MygTronBoxElement wallIcon  
]
