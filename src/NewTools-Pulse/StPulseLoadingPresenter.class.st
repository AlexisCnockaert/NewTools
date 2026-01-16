"
This is the loading widget that appears when a search is in process. It will only disappear when the full search has been completed
"
Class {
	#name : 'StPulseLoadingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'scales'
	],
	#category : 'NewTools-Pulse-View',
	#package : 'NewTools-Pulse',
	#tag : 'View'
}

{ #category : 'layout' }
StPulseLoadingPresenter >> defaultLayout [
	
	^ SpBoxLayout newLeftToRight
		vAlignCenter;
		yourself
]

{ #category : 'initialization' }
StPulseLoadingPresenter >> iconAt: aNumber [ 

	scales ifNil: [
		scales := ((self iconNamed: #protocolPrivate) 
			"contentsOfArea: (4@4 corner: 12@12)") 
			asGrayScaleWithAlpha 
			scaledToSize: 12@12 ].
	
	^ scales
]

{ #category : 'initialization' }
StPulseLoadingPresenter >> initializePresenters [ 

	"self addStyle: 'stPulseLoadingSpinner'"
]

{ #category : 'initialization' }
StPulseLoadingPresenter >> newStepImage: step [

	^ self newImage 
		image: (self iconAt: step + 1);
		yourself
]

{ #category : 'initialization' }
StPulseLoadingPresenter >> reset [

	self layout removeAll
]

{ #category : 'updating' }
StPulseLoadingPresenter >> updateStep [
	| step |

	step := self layout children size.
	step < 5 
		ifTrue: [ self layout add: (self newStepImage: step) expand: false ]
		ifFalse: [ self reset ]
]
