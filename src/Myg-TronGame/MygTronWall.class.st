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
	^ MygTronBoxElement wallIcon  
]

{ #category : #move }
MygTronWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ self board gameManager currentBoardElement resetBoard .
]
