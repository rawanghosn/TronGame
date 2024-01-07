Class {
	#name : #MygTronPlayer,
	#superclass : #MygTronMov,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronPlayer class >> textualMapCharacter [
	^ $@
]

{ #category : #'as yet unclassified' }
MygTronPlayer >> addtrail [
^ MygTronTrail new.
]

{ #category : #accessing }
MygTronPlayer >> backgroundRepresentation [
	
^ Color yellow.
]

{ #category : #'as yet unclassified' }
MygTronPlayer >> desc [ 
 ^ 'Player 1'
]

{ #category : #testing }
MygTronPlayer >> isPlayer1 [
^true
]
