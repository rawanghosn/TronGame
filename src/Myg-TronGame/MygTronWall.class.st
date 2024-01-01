Class {
	#name : #MygTronWall,
	#superclass : #MygTronElement,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronWall class >> textualMapCharacter [

	^ $#
]

{ #category : #accessing }
MygTronWall >> backgroundRepresentation [
	^ Color transparent 
]

{ #category : #move }
MygTronWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall. GameOver"
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
 
 self board gameManager currentBoardElement space close.
 space root
    when: BlKeyDownEvent do: [ :evt |
        keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ].
 self board endGame.
	^ false .
]

{ #category : #'as yet unclassified' }
MygTronWall >> restafterbump [
	self board gameManager currentBoardElement resetBoard.
	^ self board gameManager currentBoardElement
]

{ #category : #accessing }
MygTronWall >> title [
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
