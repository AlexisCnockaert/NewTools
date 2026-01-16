Class {
	#name : 'StPulseSearchToolsContext',
	#superclass : 'StPulseSearchContext',
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'accessing' }
StPulseSearchToolsContext >> associatedProcessors [

	^ { StWorldMenuProcessor }
]

{ #category : 'accessing' }
StPulseSearchToolsContext >> searchPlaceholder [

	^ 'Search for system tools...'
]
