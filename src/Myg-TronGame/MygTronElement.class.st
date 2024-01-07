Class {
	#name : #MygTronElement,
	#superclass : #MygAbstractBox,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'default encoding' }
MygTronElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
MygTronElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #move }
MygTronElement >> bringIn: aTronMovable going: aDirection [

	| previousPosition |
	previousPosition := aTronMovable position.
	aTronMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aTronMovable from: previousPosition.
	^ true
]

{ #category : #initialization }
MygTronElement >> configured [ 
^self
]

{ #category : #testing }
MygTronElement >> isPlayer1 [
	^false
]

{ #category : #testing }
MygTronElement >> isPlayer2 [
	^false
]

{ #category : #move }
MygTronElement >> moveIn: aNeighbor going: aDirection [
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #printing }
MygTronElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]

{ #category : #'as yet unclassified' }
MygTronElement >> restafterbump: boardEl space: boardElspace board: boardElboard [
	boardEl resetBoard: boardElspace board: boardElboard .
	^ boardEl 
]

{ #category : #accessing }
MygTronElement >> text: anActor [
^ 'Oops,',anActor desc,' lost ! Press Q to quit or S to restart.'
]

{ #category : #accessing }
MygTronElement >> title: anActor [
| title |

title := BlElement new background: Color blue.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ( (self text: anActor) asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 20)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
