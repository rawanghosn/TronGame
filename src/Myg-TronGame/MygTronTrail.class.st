Class {
	#name : #MygTronTrail,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronTrail class >> textualMapCharacter [

	^ $-
]

{ #category : #accessing }
MygTronTrail >> background [ 
^ self

]

{ #category : #accessing }
MygTronTrail >> backgroundRepresentation [

	^ Color yellow
]

{ #category : #move }
MygTronTrail >> bringIn: anActor going: aDirection [
	"anActor does not move in a trail. Nothing enter a trail."
	
	^ false
]
