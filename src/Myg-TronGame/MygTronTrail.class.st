Class {
	#name : #MygTronTrail,
	#superclass : #MygTronElement,
	#instVars : [
		'player'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronTrail class >> textualMapCharacter [

	^ $-
]

{ #category : #accessing }
MygTronTrail >> background [ 
^ self

]

{ #category : #accessing }
MygTronTrail >> backgroundRepresentation [

	^ self backgroundRepresentation 
]

{ #category : #move }
MygTronTrail >> bringIn: anActor going: aDirection [
	"anActor does not move in a trail. Nothing enter a trail."
| space title keyDownBlockByKey boardEl boardElboard boardElspace|
	space := BlSpace new.
	space pulse
		extent:500 @ 500;
		resizable: false.
	title := self title: anActor.
	space root addChild: title.

	space root background: Color blue.
	space root layout: BlFrameLayout new.
	space show.	
  
  boardEl := self player board gameManager currentBoardElement.
  boardElspace := boardEl space.
  boardElboard := boardEl board.

  keyDownBlockByKey := {
  KeyboardKey S -> [ space close. self restafterbump: boardEl space: boardElspace board: boardElboard  ].
  KeyboardKey Q -> [ space close.]. "quit"} asOrderedDictionary.
 
 boardElspace close.
 space root
    when: BlKeyDownEvent do: [ :evt |
        keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ].
^ false
]

{ #category : #accessing }
MygTronTrail >> player [
^ player
]

{ #category : #accessing }
MygTronTrail >> player: aPlayer [
 player:= aPlayer 
]
