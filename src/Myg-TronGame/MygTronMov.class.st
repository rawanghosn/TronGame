Class {
	#name : #MygTronMov,
	#superclass : #MygTronElement,
	#classVars : [
		'background'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #accessing }
MygTronMov >> background [

	^background 
]

{ #category : #accessing }
MygTronMov >> background: anObject [

	background := anObject
]

{ #category : #initialization }
MygTronMov >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #initialization }
MygTronMov >> defaultBackground [

	^ MygTronGround new
]
