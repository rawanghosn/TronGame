Class {
	#name : #MygTronTrail,
	#superclass : #MygTronElement,
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

	^ Color yellow
]

{ #category : #move }
MygTronTrail >> bringIn: anActor going: aDirection [
	"anActor does not move in a trail. Nothing enter a trail."
| space title|
	space := BlSpace new.
	space pulse
		extent:200 @ 200;
		resizable: false.
	title := BlElement new background: Color black .
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Game ended' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 20)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	
	space root addChild: title.

	space root background: Color blue.
	space root layout: BlFrameLayout new.
	space show.
"  self restafterbump."
^ false
]
