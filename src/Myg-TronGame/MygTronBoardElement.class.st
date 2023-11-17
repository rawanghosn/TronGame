Class {
	#name : #MygTronBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer'
	],
	#category : #'Myg-TronGame-UI'
}

{ #category : #'as yet unclassified' }
MygTronBoardElement class >> openWithModel: aTronBoard [

	self new openWithModel: aTronBoard.
]

{ #category : #accessing }
MygTronBoardElement >> backgroundLayer [

	^backgroundLayer
]

{ #category : #accessing }
MygTronBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
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
	
"board: aSkBoard

	board := aSkBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ]."
	
	self
		initializeBackgroundLayer;
		initializeForegroundLayer
]

{ #category : #accessing }
MygTronBoardElement >> foregroundLayer [

	^foregroundLayer
]

{ #category : #accessing }
MygTronBoardElement >> foregroundLayer: aBlElement [

	foregroundLayer := aBlElement 
]

{ #category : #initialization }
MygTronBoardElement >> initialize [
	super initialize.
	"self initializeDirectionDict."
	self
		background: (BlBackground paint: Color veryLightGray);
		layout: BlFrameLayout new;
		requestFocus
]

{ #category : #initialization }
MygTronBoardElement >> initializeBackgroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygTronMov ) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (MygTronBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #initialization }
MygTronBoardElement >> initializeForegroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygTronMov ) ifFalse: [
			tmpBox := MygTronGround new ].
		boxElement := (MygTronBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> openWithModel: aTronBoard [

	| space |
	space := BlSpace new.
	space pulse
		extent:500 @ 500;
		resizable: false.
	space root addChild: self.

	self board: aTronBoard.
	
	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space show
]
