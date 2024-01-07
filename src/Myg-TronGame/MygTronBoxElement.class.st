Class {
	#name : #MygTronBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#category : #'Myg-TronGame-UI'
}

{ #category : #accessing }
MygTronBoxElement class >> box: aBox [ 

	^ self new box: aBox
]

{ #category : #'class initialization' }
MygTronBoxElement class >> initialize [ 

	Icons :=Dictionary new 
]

{ #category : #'as yet unclassified' }
MygTronBoxElement >> backgroundPaint [ 
	^ Color transparent
]

{ #category : #accessing }
MygTronBoxElement >> board [
	^board
]

{ #category : #accessing }
MygTronBoxElement >> board: aTronBoard [

	board := aTronBoard .

	self
		constraintsDo: [ :c | c horizontal matchParent ]
]

{ #category : #accessing }
MygTronBoxElement >> box [
	^box 
]

{ #category : #accessing }
MygTronBoxElement >> box: aTronElement [

	box := aTronElement.
]

{ #category : #accessing }
MygTronBoxElement >> boxForForeground [

		self box: (self board atPosition: self positionInField)
			
]

{ #category : #initialization }
MygTronBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new; 
		constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical matchParent.].
]

{ #category : #accessing }
MygTronBoxElement >> positionInField [

	^positionInField 
]

{ #category : #accessing }
MygTronBoxElement >> positionInField: aPoint [

	positionInField := aPoint
]

{ #category : #accessing }
MygTronBoxElement >> updateBackgroundColor [

	| bg |
	bg := self box backgroundRepresentation.
	bg class = Form ifTrue: [
		| size boardElement space |
		
		boardElement := self parent parent parent.
		space := boardElement space.
		size := space extent / boardElement board width
		        - boardElement firstChild layout cellSpacing.
		bg := bg scaledIntoFormOfSize: size ].
	self background: bg
]
