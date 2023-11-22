Class {
	#name : #MygTronBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict'
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

"board := aTronBoard.
self layout:
(BlGridLayout horizontal cellSpacing: 5 - (board grid width // 5)).
self constraintsDo: [ :aLayoutConstraints |
aLayoutConstraints horizontal matchParent.
aLayoutConstraints vertical matchParent ].
self padding: (BlInsets all: 5).
self layout columnCount: board grid width."

"board: aSkBoard"

board := aTronBoard.
self constraintsDo: [ :c |
c frame vertical alignCenter.
c horizontal matchParent.
c vertical fitContent ].

self
initializeBackgroundLayer;
initializeForegroundLayer
]

{ #category : #accessing }
MygTronBoardElement >> directionDict [ 
	^ directionDict 
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childNamed: aPoint asString) firstChild.
	neighborElement := (layer childNamed:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygTronWall ifFalse: [
		nextNeighborElement := (layer childNamed:
			                       (aCpDirection * (aCpDirection * aPoint))
				                       asString) firstChild.
		elements add: nextNeighborElement ].
	^ elements
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
	self initializeDirectionDict.
	self
		background: (BlBackground paint: Color black );
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvents: anEvent ];
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
MygTronBoardElement >> initializeDirectionDict [

	directionDict := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
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

{ #category : #initialization }
MygTronBoardElement >> manageEvents: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [
		self resetBoard.
		^ self ].
	anEvent key name = #ESCAPE ifTrue: [
		self space close.
		^ self ].
	board isFinished ifTrue: [ ^ self ].
	player := self board player.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].
	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	moved := player move: direction.

	neighborElement := elements second.

	moved ifTrue: [self updateElement: elements ]
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

{ #category : #initialization }
MygTronBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> updateElement: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
