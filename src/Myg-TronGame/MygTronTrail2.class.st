Class {
	#name : #MygTronTrail2,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame-Model'
}

{ #category : #accessing }
MygTronTrail2 >> background [ 
^ self

]

{ #category : #accessing }
MygTronTrail2 >> backgroundRepresentation [

	^ Color blue
]

{ #category : #move }
MygTronTrail2 >> bringIn: anActor going: aDirection [
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
  KeyboardKey Q -> [ space close. self board gameManager currentBoardElement space close]. "quit"} asOrderedDictionary.
  
 space root
    when: BlKeyDownEvent do: [ :evt |
        keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ].
^ false
]

{ #category : #accessing }
MygTronTrail2 >> title [
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