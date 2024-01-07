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

	"| dict |
	dict := {
		        (CpNorthDirection -> MygTronBoxElement playerUpIcon).
		        (CpWestDirection -> MygTronBoxElement playerLeftIcon).
		        (CpSouthDirection -> MygTronBoxElement playerDownIcon).
		        (CpEastDirection -> MygTronBoxElement playerRightIcon) } asDictionary.
	^ dict at: self facing"
	
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
