Class {
	#name : 'StPulseSearchContext',
	#superclass : 'Object',
	#instVars : [
		'browser'
	],
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'accessing' }
StPulseSearchContext class >> searchEditors [

	^ StPulseSearchWindowsContext new
]

{ #category : 'private' }
StPulseSearchContext class >> searchEnvironment [

	^ StPulseSearchEnvironmentContext new
]

{ #category : 'accessing' }
StPulseSearchContext class >> searchTools [

	^ StPulseSearchToolsContext new
]

{ #category : 'visiting' }
StPulseSearchContext >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : 'accessing' }
StPulseSearchContext >> associatedProcessors [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
StPulseSearchContext >> browser [

	^ browser
]

{ #category : 'accessing' }
StPulseSearchContext >> browser: aDockBrowser [

	browser := aDockBrowser
]

{ #category : 'accessing' }
StPulseSearchContext >> searchPlaceholder [

	^ self subclassResponsibility
]
