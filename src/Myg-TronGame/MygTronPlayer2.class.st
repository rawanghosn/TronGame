Class {
	#name : #MygTronPlayer2,
	#superclass : #MygTronMov,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronPlayer2 class >> textualMapCharacter [
	^ $+
]

{ #category : #accessing }
MygTronPlayer2 >> background [

	^background
]

{ #category : #accessing }
MygTronPlayer2 >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygTronPlayer2 >> backgroundRepresentation [
	
^ Color blue.
]

{ #category : #testing }
MygTronPlayer2 >> isPlayer2 [ 
^true
]
