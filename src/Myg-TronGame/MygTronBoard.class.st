Class {
	#name : #MygTronBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player1',
		'player1box',
		'player2',
		'player2box',
		'ended',
		'gamemanager'
	],
	#category : #'Myg-TronGame-Model'
}

{ #category : #initialization }
MygTronBoard class >> createWithBoard: aCtNewArray2D [
     
^ self new 
	configureGrid: aCtNewArray2D;
	yourself 
]

{ #category : #initialization }
MygTronBoard class >> createWithBoard:  aCTNewArray2D managedBy: aTronGameManager [
^(self createWithBoard: aCTNewArray2D)
        gameManager: aTronGameManager;
		  yourself 
]

{ #category : #'as yet unclassified' }
MygTronBoard class >> level1Grid [
^
'#########################
#||||||||||||||||||||||@#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#+ | | | | | | | | | | |#
#|||||||||||||||||||||||#
#| | | | | | | | | | | |#
#|||||||||||||||||||||||#
#########################'.
	
]

{ #category : #printing }
MygTronBoard >> asciiString [ 

	^ String streamContents: [ :st |
		self printOn: st ]	

]

{ #category : #accessing }
MygTronBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
MygTronBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
MygTronBoard >> atPosition: aCpPositionable [ 
	^ (grid at: aCpPositionable x @ aCpPositionable y)
]

{ #category : #initialization }
MygTronBoard >> configureGrid: aCTNewArray2D [
 super configureGrid: aCTNewArray2D.
 self setPlayer.
]

{ #category : #enumerating }
MygTronBoard >> do: aBlock [

	grid do: aBlock
]

{ #category : #actions }
MygTronBoard >> endGame [

	ended ifTrue: [ ^ self ].
	ended := true.
]

{ #category : #actions }
MygTronBoard >> ended [ 
^ ended
]

{ #category : #accessing }
MygTronBoard >> gameManager [

	^gamemanager
]

{ #category : #accessing }
MygTronBoard >> gameManager: aTronGameManager [

	gamemanager:= aTronGameManager 
]

{ #category : #accessing }
MygTronBoard >> height [
^ grid height
]

{ #category : #initialization }
MygTronBoard >> initialize [ 
	super initialize.
	ended:=false.
]

{ #category : #move }
MygTronBoard >> moveStepsPlayer1: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player1 move: each ]
]

{ #category : #move }
MygTronBoard >> moveStepsPlayer2: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player2 move: each ]
]

{ #category : #accessing }
MygTronBoard >> player1 [
^player1
]

{ #category : #accessing }
MygTronBoard >> player1box [
^player1box
]

{ #category : #accessing }
MygTronBoard >> player1box: playerBl [
 player1box := playerBl 
]

{ #category : #accessing }
MygTronBoard >> player2 [
^player2
]

{ #category : #accessing }
MygTronBoard >> player2box [
^player2box
]

{ #category : #accessing }
MygTronBoard >> player2box: playerBl [
 player2box := playerBl 
]

{ #category : #printing }
MygTronBoard >> printOn: aStream [

	(1 to: grid height)
		do: [ :rowNumber |
			1 to: grid width do: [ :columnNumber |
				| el elClass |
				el := self atColumn: columnNumber atRow: rowNumber .
				elClass := el class.
				aStream nextPut: elClass textualMapCharacter ] ]
		separatedBy: [ aStream cr ]
]

{ #category : #initialization }
MygTronBoard >> reset [

	self gameManager launchAgain
]

{ #category : #initialization }
MygTronBoard >> setPlayer [ 
 player1 := grid contents detect: #isPlayer1.
 player2 := grid contents detect: #isPlayer2
]

{ #category : #move }
MygTronBoard >> updatePositionOf: aTronMovable from: previousPosition [
	"Put trail behind the player."

	aTronMovable class = MygTronPlayer
		ifTrue: [
			|trail1|
			trail1 := MygTronTrail1 new.
			trail1 player: player1.
		self
				atColumn: previousPosition x
				atRow: previousPosition y
				put: trail1.]
		ifFalse: [
			aTronMovable class = MygTronPlayer2 ifTrue: [
			  |trail2|
			  trail2 := MygTronTrail2 new.
			  trail2 player: player2.
				self
					atColumn: previousPosition x
					atRow: previousPosition y
					put: trail2 ] ].
	"put the current position element as previous background of the moving element."
	aTronMovable background:
		(self
			 atColumn: aTronMovable position x
			 atRow: aTronMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aTronMovable position x
		atRow: aTronMovable position y
		put: aTronMovable

]

{ #category : #accessing }
MygTronBoard >> width [
	^ grid width
]
