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
  KeyboardKey S -> [ space close. self restafterbump: boardEl space: boardElspace board: boardElboard ].
  KeyboardKey Q -> [ space close.]. "quit"} asOrderedDictionary.
 
 boardElspace close.
 self board endGame.
 space root
    when: BlKeyDownEvent do: [ :evt |
        keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ].
	^ false .
]

{ #category : #accessing }
MygTronWall >> text: anActor [
^ 'Oops,',anActor desc,' hit a wall ! Press Q to quit or S to restart.' .
]
