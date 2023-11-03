Class {
	#name : #MygTronPlayer,
	#superclass : #MygTronElement,
	#instVars : [
		'facing'
	],
	#category : #'Myg-TronGame'
}

{ #category : #'default encoding' }
MygTronPlayer class >> textualMapCharacter [

	^ $@
]

{ #category : #accessing }
MygTronPlayer >> backgroundRepresentation [

	| dict |
	dict := {
		        (CpNorthDirection -> MygSkBoxElement playerUpIcon).
		        (CpWestDirection -> MygSkBoxElement playerLeftIcon).
		        (CpSouthDirection -> MygSkBoxElement playerDownIcon).
		        (CpEastDirection -> MygSkBoxElement playerRightIcon) } asDictionary.
	^ dict at: self facing
]

{ #category : #accessing }
MygTronPlayer >> facing [ 
	^facing
]

{ #category : #accessing }
MygTronPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #initialization }
MygTronPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]
