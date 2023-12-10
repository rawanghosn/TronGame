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
	| space title keyDownBlockByKey|
	space := BlSpace new.
	space pulse
		extent:500 @ 500;
		resizable: false.
	title := self title.
	space root addChild: title.

	space root background: Color blue.
	space root layout: BlFrameLayout new.
	space show.	
		
  keyDownBlockByKey := {
  KeyboardKey S -> [ space close. self restafterbump ].
  KeyboardKey Q -> [ space close. self board gameManager currentBoardElement space close]. "quit"} asOrderedDictionary.
  
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

{ #category : #'as yet unclassified' }
MygTronMov >> restafterbump [
	self board gameManager currentBoardElement resetBoard.
	^ self board gameManager currentBoardElement
]
