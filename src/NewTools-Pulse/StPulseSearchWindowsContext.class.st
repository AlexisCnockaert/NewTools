Class {
	#name : 'StPulseSearchWindowsContext',
	#superclass : 'StPulseSearchContext',
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'accessing' }
StPulseSearchWindowsContext >> associatedProcessors [

	^ { StWindowsProcessor }
]

{ #category : 'accessing' }
StPulseSearchWindowsContext >> searchPlaceholder [

	^ 'Search for open windows...'
]
