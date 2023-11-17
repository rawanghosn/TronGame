Class {
	#name : #MygTronPlayer,
	#superclass : #MygTronMov,
	#instVars : [
		'facing',
		'background'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronPlayer class >> textualMapCharacter [
	^ $@
]

{ #category : #accessing }
MygTronPlayer >> background [

	^background
]

{ #category : #accessing }
MygTronPlayer >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygTronPlayer >> backgroundRepresentation [

	| dict |
	dict := {
		        (CpNorthDirection -> MygTronBoxElement playerUpIcon).
		        (CpWestDirection -> MygTronBoxElement playerLeftIcon).
		        (CpSouthDirection -> MygTronBoxElement playerDownIcon).
		        (CpEastDirection -> MygTronBoxElement playerRightIcon) } asDictionary.
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
