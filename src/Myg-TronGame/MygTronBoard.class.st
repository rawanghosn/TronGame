Class {
	#name : #MygTronBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
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
'####################
 #                  #
 #                  #
 #                  #
 #           @      #       
 ####################'.

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

{ #category : #accessing }
MygTronBoard >> gameManager [

	^gamemanager
]

{ #category : #accessing }
MygTronBoard >> gameManager: aTronGameManager [

	gamemanager:= aTronGameManager 
]

{ #category : #accessing }
MygTronBoard >> initialize [ 
	super initialize.
	ended:=false.
]

{ #category : #move }
MygTronBoard >> moveSteps: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #accessing }
MygTronBoard >> player [
^player
]

{ #category : #initialization }
MygTronBoard >> setPlayer [ 
 player := grid contents detect: #isPlayer
]

{ #category : #move }
MygTronBoard >> updatePositionOf: aTronMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aTronMovable background.
	"put the current position element as previous background of the moving element."
	aTronMovable background:
		(self atColumn: aTronMovable position x atRow: aTronMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aTronMovable position x
		atRow: aTronMovable position y
		put: aTronMovable.
	"self isFinished ifTrue: [ self endGame ]"
]

{ #category : #accessing }
MygTronBoard >> width [
	^ grid width
]
