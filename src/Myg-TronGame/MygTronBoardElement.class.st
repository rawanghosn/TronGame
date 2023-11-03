Class {
	#name : #MygTronBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'Myg-TronGame'
}

{ #category : #'as yet unclassified' }
MygTronBoardElement class >> openWithModel: aTField [

	| aFieldElement space |
	space := BlSpace new.
	aFieldElement := self new
		                 board: aTField;
		                 yourself.
	space root addChild: aFieldElement.
	space pulse
		extent: 500 @ 500;
		resizable: false;
		show
]

{ #category : #accessing }
MygTronBoardElement >> board [
	^board 
]

{ #category : #accessing }
MygTronBoardElement >> board: aTronBoard [

	board := aTronBoard.
	self layout:
		(BlGridLayout horizontal cellSpacing: 5 - (board grid width // 5)).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self padding: (BlInsets all: 5).
	self layout columnCount: board grid width.
]

{ #category : #initialization }
MygTronBoardElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color transparent ).
]
