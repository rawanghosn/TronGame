Class {
	#name : #MygTronGround,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame'
}

{ #category : #'default encoding' }
MygTronGround class >> textualMapCharacter [

	^ Character space
]

{ #category : #accessing }
MygTronGround >> backgroundRepresentation [

	^ Color transparent
]
