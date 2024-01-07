Class {
	#name : #MygTronMov,
	#superclass : #MygTronElement,
	#classVars : [
		'background',
		'position',
		'trail'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronMov class >> textualMapCharacter [ 
^ self textualMapCharacter 
]

{ #category : #'as yet unclassified' }
MygTronMov >> addtrail [ 
^ self addtrail.
]

{ #category : #accessing }
MygTronMov >> background [

	^background 
]

{ #category : #accessing }
MygTronMov >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygTronMov >> backgroundRepresentation [ 
^ self backgroundRepresentation 
]

{ #category : #accessing }
MygTronMov >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #move }
MygTronMov >> bringIn: anActor going: aDirection [
	"GameOver"
	| space title keyDownBlockByKey boardEl boardElspace boardElboard|
	space := BlSpace new.
	space pulse
		extent:500 @ 500;
		resizable: false.
	title := self title: anActor.
	space root addChild: title.

	space root background: Color blue.
	space root layout: BlFrameLayout new.
	space show.	

  boardEl := self board gameManager currentBoardElement.	
  boardElspace := boardEl space.	
  boardElboard := boardEl board.	
		
  keyDownBlockByKey := {
  KeyboardKey S -> [ space close. self restafterbump: boardEl space: boardElspace board: boardElboard  ].
  KeyboardKey Q -> [ space close.]. "quit"} asOrderedDictionary.
 
 boardElspace close.
 space root
    when: BlKeyDownEvent do: [ :evt |
        keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ].
 self board endGame.
	^ true .
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

{ #category : #'as yet unclassified' }
MygTronMov >> desc [
^ self desc
]

{ #category : #accessing }
MygTronMov >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #move }
MygTronMov >> moveEast [

	^ self move: CpDirection east
]

{ #category : #move }
MygTronMov >> moveNorth [ 
	^ self move: CpDirection north
]

{ #category : #move }
MygTronMov >> moveSouth [

	^ self move: CpDirection south
]

{ #category : #move }
MygTronMov >> moveWest [

	^ self move: CpDirection west
]

{ #category : #accessing }
MygTronMov >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
