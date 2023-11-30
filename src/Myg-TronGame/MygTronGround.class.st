Class {
	#name : #MygTronGround,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronGround class >> textualMapCharacter [

	^ Character space
]

{ #category : #accessing }
MygTronGround >> backgroundRepresentation [

	^ Color transparent
]

{ #category : #move }
MygTronGround >> bringIn: anActor going: aDirection [
	"anActor does not move in a ground. Nothing enter a ground."
	
	^ false .
]
