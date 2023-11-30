Class {
	#name : #TronGame,
	#superclass : #Object,
	#category : #'Myg-TronGame-UI'
}

{ #category : #'as yet unclassified' }
TronGame class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #'as yet unclassified' }
TronGame class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: ('Welcome to TronGame!

Game Presentation: TronGame is a classic and iconic game where players control lines of light and must strategically maneuver to avoid colliding with the trails left behind by themselves or their opponents. As players move their light cycle, they leave a trail behind them, and these trails persist on the game board until the round ends.

Game Objective: Eliminate opponents by forcing them to collide with either their own or your light cycle trails. Be the last player standing to win the round.

Key Press: Use controls to direct the light cycles.

Collision: When a player''s light cycle collides with a trail or a barrier, the round ends, and a round winner is determined.

Have fun!' asRopedText foreground: Color white).
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightBlue;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'as yet unclassified' }
TronGame class >> menuLevel [ 
    | menu  stream selector manager|
    menu := ToMenu new.
    menu label: (ToLabel text: 'Play').
    menu icon: (ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).

    stream := 'Start'.  "Specify your level here"
    selector := 'level1Grid'.  "Specify your grid here" 
	 manager := MygTronGameManager menu: menu.
    menu addItem: ((ToButtonMenuItem new labelText: stream) whenClickedDo: [
	       | string |
	
				string := MygTronBoard level1Grid.
				manager launchFromString: string.
        "MygTronBoardElement openWithModel: (MygTronBoard perform: selector asSymbol)"
    ]).

    ^ menu

]

{ #category : #'instance creation' }
TronGame class >> open [

	| space levelMenu helpMenu bar title |
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: levelMenu.
	bar addMenu: helpMenu.
	space := BlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : #accessing }
TronGame class >> title [

	| title |
	title := BlElement new background: Color veryDarkGray.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Tron Game' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 50)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
