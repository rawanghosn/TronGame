Class {
	#name : #MygTronBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict1',
		'directionDict2',
		'repetitiveTask'
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
MygTronBoardElement >> directionDict1 [
	^ directionDict1
]

{ #category : #accessing }
MygTronBoardElement >> directionDict2 [
	^ directionDict2
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childNamed: aPoint asString) firstChild.
	neighborElement := (layer childNamed:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	"(neighborElement board grid at: neighborElement positionInField)
		class = MygTronWall ifFalse: [
		nextNeighborElement := (layer childNamed:
			                       (aCpDirection * (aCpDirection * aPoint))
				                       asString) firstChild.
		elements add: nextNeighborElement ]."
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
		addEventHandlerOn: BlKeyUpEvent
		do: [ :anEvent | self manageUpEvents: anEvent ];
		requestFocus.
	
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
				             c vertical matchParent  ];
			             addChild: boxElement;
			border: (BlBorder paint: Color white);
			clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #initialization }
MygTronBoardElement >> initializeDirectionDict [

	directionDict1 := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
		
	directionDict2 := {
		        (#S -> CpDirection south).
		        (#Z -> CpDirection north).
		        (#Q -> CpDirection west).
		        (#D -> CpDirection east) } asDictionary.
	
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
		| boxElement tmpBox container|
		
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
				             c vertical fitContent  ];
			             addChild: boxElement;
			border: (BlBorder paint: Color white);
	      clipChildren: false.
	
	(aBox class = MygTronPlayer ) ifTrue: [ self board player1box: container] .
	(aBox class = MygTronPlayer2 ) ifTrue: [  self board player2box: container].
    
		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #initialization }
MygTronBoardElement >> manageEvents: anEvent [
   |task1 task2|
	anEvent key name = #SPACE ifTrue: [
		self resetBoard.
		^ self ].
	anEvent key name = #ESCAPE ifTrue: [
		self space close.
		^ self ].
  task1 := (BlRepeatedTaskAction new
		delay: 70 milliSeconds;
		action: [ self moveplayer: self board player1 direction: anEvent. ];
		yourself).
  task2 := (BlRepeatedTaskAction new
		delay: 70 milliSeconds;
		action: [ self moveplayer: self board player2 direction: anEvent. ];
		yourself).
		
  (directionDict1 includesKey: anEvent key name ) ifTrue: [ 
   self board player1box enqueueTask: task1.
   ].

  (directionDict2 includesKey: anEvent key name ) ifTrue: [ 
   self board player2box enqueueTask: task2.
   ].

   (directionDict1 includesKey: anEvent key name ) ifTrue: [  self repetitiveTask: task1. ] ifFalse: [  self repetitiveTask: task2. ] 
  

]

{ #category : #initialization }
MygTronBoardElement >> manageUpEvents: anEvent [
  ((directionDict1 includesKey: anEvent key name ) | (directionDict2 includesKey: anEvent key name )) ifTrue: [ 
   self repetitiveTask stop. ].
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> moveplayer: aPlayer direction: anEvent [
|direction1 elements moved neighborElement|
  direction1 := self directionDict1
		             at: anEvent key name
		             ifAbsent: [ self directionDict2
		             at: anEvent key name
		             ifAbsent: [ ^ self ] ].

	elements := self
		            elementsToUpdateAtPosition: aPlayer position
		            goingIn: direction1.
	moved := aPlayer move: direction1.
	neighborElement := elements second.

  moved ifTrue: [self updateElement: elements ].

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
	
	space root background: Color blue.
	space root layout: BlFrameLayout new.
	space show
]

{ #category : #accessing }
MygTronBoardElement >> repetitiveTask [
	^ repetitiveTask 
]

{ #category : #accessing }
MygTronBoardElement >> repetitiveTask: task [
	repetitiveTask := task
]

{ #category : #initialization }
MygTronBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #initialization }
MygTronBoardElement >> resetBoard: space board: elboard [

	space close.
	elboard reset
]

{ #category : #'as yet unclassified' }
MygTronBoardElement >> updateElement: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
