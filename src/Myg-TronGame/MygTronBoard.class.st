Class {
	#name : #MygTronBoard,
	#superclass : #MygBoard,
	#category : #'Myg-TronGame'
}

{ #category : #'as yet unclassified' }
MygTronBoard class >> level1Grid [
	"represents this grid: 
	
	| 1 | _ | _ | _ |
	| _ | _ | 1 | 0 | 
	| _ | 1 | 1 | _ |
	| _ | _ | _ | _ |"
	| level |
	level := 
'######
 #    #
 #    #
 # @  #
 #    #
 #    #
 ######'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]
