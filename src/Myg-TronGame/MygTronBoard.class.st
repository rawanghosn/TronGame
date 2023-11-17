Class {
	#name : #MygTronBoard,
	#superclass : #MygBoard,
	#category : #'Myg-TronGame-Model'
}

{ #category : #'as yet unclassified' }
MygTronBoard class >> level1Grid [

	| level |
	level := 
'####################
 #        #
 #        #
 #        #
 #        #
 ####################'.

	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #enumerating }
MygTronBoard >> do: aBlock [

	grid do: aBlock
]

{ #category : #accessing }
MygTronBoard >> width [
	^ grid width
]
