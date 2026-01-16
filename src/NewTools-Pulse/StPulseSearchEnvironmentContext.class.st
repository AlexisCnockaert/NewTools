Class {
	#name : 'StPulseSearchEnvironmentContext',
	#superclass : 'StPulseSearchContext',
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'accessing' }
StPulseSearchEnvironmentContext >> associatedProcessors [

	^ { StUnifiedProcessor }
]

{ #category : 'accessing' }
StPulseSearchEnvironmentContext >> searchPlaceholder [

	^ 'Search for classes, methods, packages...'
]
