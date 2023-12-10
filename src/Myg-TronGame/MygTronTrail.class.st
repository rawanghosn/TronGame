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
  KeyboardKey Q -> [ space close. self quitgame.]. "quit"} asOrderedDictionary.
  
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

{ #category : #'as yet unclassified' }
MygTronTrail >> quitgame [
^ self player board gameManager currentBoardElement space close
]

{ #category : #'as yet unclassified' }
MygTronTrail >> restafterbump [
	self player board gameManager currentBoardElement resetBoard.
	^ self player board gameManager currentBoardElement
]

{ #category : #accessing }
MygTronTrail >> title [
| title |
title := BlElement new background: Color blue .
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Game ended. Press Q to quit or S to restart.' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 25)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
