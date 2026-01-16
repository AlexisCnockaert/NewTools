"
A WindowConfiguration is a description of the window on the screen (extent, position, kind, strategy)
"
Class {
	#name : 'CavAbstractWindowPlaceHolder',
	#superclass : 'Object',
	#instVars : [
		'windows',
		'extent',
		'kind',
		'position',
		'strategy',
		'count',
		'xPercentage',
		'yPercentage',
		'widthPercentage',
		'heightPercentage'
	],
	#category : 'NewTools-Window-Profiles-Model',
	#package : 'NewTools-Window-Profiles',
	#tag : 'Model'
}

{ #category : 'examples' }
CavAbstractWindowPlaceHolder class >> exampleTranscript [

	^ self new 
		extent: 400@666;
		position: 180.0@106.0;
		kind: #Transcript;
		yourself


	
]

{ #category : 'ston-core' }
CavAbstractWindowPlaceHolder class >> stonAllInstVarNames [

	^ super stonAllInstVarNames copyWithout: #windows
]

{ #category : 'initialization' }
CavAbstractWindowPlaceHolder >> configureStrategy [


	strategy placeHolder: self

	
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> count [
	^ count
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> count: aNumber [

	count := aNumber
]

{ #category : 'api' }
CavAbstractWindowPlaceHolder >> display [

	| visualPlaceHolder textMorph |
	textMorph := TextMorph new contents:
		             kind printString , ' - ' , self strategy class title.
	visualPlaceHolder := CavVisualPlaceHolderMorph new
		                     extent: extent;
		                     position: position;
		                     kind: kind;
		                     addMorph: (textMorph position:
					                      position x
					                      + (extent x - textMorph width / 2)
					                      @ (position y + 3)).

	visualPlaceHolder placeHolder: self.
	visualPlaceHolder openInWorld
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> extent [
	^ extent
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> extent: aPoint [ 
	extent := aPoint
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> heightPercentage [

	^ heightPercentage
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> heightPercentage: anObject [

	heightPercentage := anObject
]

{ #category : 'initialization' }
CavAbstractWindowPlaceHolder >> increment [ 
	
	count := count + 1
]

{ #category : 'initialization' }
CavAbstractWindowPlaceHolder >> initialize [

	super initialize.
	strategy := CavStackingStrategy new.
	strategy placeHolder: self.
	windows := OrderedCollection new.
	"count is counting the number of opened window.
	not really nice but let us get started."
	kind := 'empty'.
	count := 1
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> kind [

	^ kind
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> position [
	^ position
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> position: aPoint [ 
	position := aPoint
]

{ #category : 'printing' }
CavAbstractWindowPlaceHolder >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '(' , kind printString , ' with ' , self strategy class name , ')'
]

{ #category : 'printing' }
CavAbstractWindowPlaceHolder >> resetCount [ 
	 
	count := 0.
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> strategy [ 

	^ strategy
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> strategy: aStrategy [

	strategy := aStrategy.
	aStrategy placeHolder: self.
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> widthPercentage [

	^ widthPercentage
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> widthPercentage: anObject [

	widthPercentage := anObject
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> windows [

	^ windows 
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> xPercentage [

	^ xPercentage
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> xPercentage: anObject [

	xPercentage := anObject
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> yPercentage [

	^ yPercentage
]

{ #category : 'accessing' }
CavAbstractWindowPlaceHolder >> yPercentage: anObject [

	yPercentage := anObject
]
