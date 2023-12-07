Class {
	#name : #TronGame,
	#superclass : #Object,
	#category : #'Myg-TronGame-UI'
}

{ #category : #'as yet unclassified' }
TronGame class >> backgroundContents [
^
'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'
]

{ #category : #accessing }
TronGame class >> container [

    ^ BlElement new
          background: (Form fromBinaryStream:
                       self backgroundContents base64Decoded asByteArray readStream);
          layout: BlFrameLayout new;
          size: 90 @ 110;
          constraintsDo: [ :c |
              c horizontal matchParent.
              c vertical matchParent ]
]

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


Game Presentation:
TronGame is a classic and iconic game where players control lines of light 
and must strategically maneuver to avoid colliding with the trails left behind
by themselves or their opponents. As players move their light cycle,
they leave a trail behind them, and these trails persist on the game board until the round ends.


Game Objective:
Eliminate opponents by forcing them to collide with either their own or your light cycle trails.
Be the last player standing to win the round.


Key Press:
Use controls to direct the light cycles.


Collision:
When a player''s light cycle collides with a trail or a barrier, the round ends, 
and a round winner is determined.

Have fun!' asRopedText foreground: Color white).
                lab beMultiLine.
                lab hMatchParent.
                container := BlElement new
                                     background: Color lightBlue;
                                     padding: (BlInsets all: 15);
                                     layout: BlLinearLayout vertical;
                                     constraintsDo: [ :c |
                                             c horizontal matchParent .
                                             c vertical matchParent  ].
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
					 space extent: 600 @ 480.
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
 <script>
	| space  levelMenu  helpMenu bar "title"  container|
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	container := self container.
	"title := self title."

	bar addMenu: levelMenu.
	bar addMenu: helpMenu.
	space := BlSpace new.
	
"	space root addChild: title."
	

	"container that spands across the window, it has the backgroundContents as background, which is an image in 64base"

   
   
 	space root addChild: container.
	space root addChild: bar.
   	space extent: 600 @ 400.
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
