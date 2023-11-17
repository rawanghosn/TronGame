Class {
	#name : #MygTronGameManager,
	#superclass : #Object,
	#instVars : [
		'currentBoardElement',
		'currentMoveCount'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #accessing }
MygTronGameManager >> currentBoardElement [

	^currentBoardElement
]

{ #category : #accessing }
MygTronGameManager >> currentBoardElement: aTronBoardElement [

	currentBoardElement:= aTronBoardElement 
]

{ #category : #accessing }
MygTronGameManager >> currentMoveCount [

	^currentMoveCount
]

{ #category : #accessing }
MygTronGameManager >> currentMoveCount: aNumber [

	currentMoveCount:= aNumber 
]

{ #category : #initialization }
MygTronGameManager >> initialize [

	super initialize.
	currentMoveCount := 0.
]
