"
Keep a well known process definition, that handles the capability of a process to be terminated, debugged, etc.
 
"
Class {
	#name : 'StWellKnownProcess',
	#superclass : 'Object',
	#instVars : [
		'definitionBlock',
		'label',
		'allowStop',
		'allowDebug'
	],
	#category : 'NewTools-ProcessBrowser-Browsers',
	#package : 'NewTools-ProcessBrowser',
	#tag : 'Browsers'
}

{ #category : 'instance creation' }
StWellKnownProcess class >> newDefinition: aBlock [

	^ self 
		newDefinition: aBlock 
		allowStop: false 
		allowDebug: false 
		label: nil
]

{ #category : 'instance creation' }
StWellKnownProcess class >> newDefinition: aBlock allowStop: stopBoolean allowDebug: debugBoolean [

	^ self 
		newDefinition: aBlock 
		allowStop: stopBoolean 
		allowDebug: debugBoolean 
label: nil
]

{ #category : 'instance creation' }
StWellKnownProcess class >> newDefinition: aBlock allowStop: stopBoolean allowDebug: debugBoolean label: aString [

	^ self new 
		definition: aBlock; 
		allowStop: stopBoolean; 
		allowDebug: debugBoolean; 
		label: aString;
		yourself
]

{ #category : 'instance creation' }
StWellKnownProcess class >> newDefinition: aBlock label: aString [

	^ self 
		newDefinition: aBlock 
		allowStop: false 
		allowDebug: false 
label: aString
]

{ #category : 'testing' }
StWellKnownProcess >> allowDebug [

	^ allowDebug
]

{ #category : 'accessing' }
StWellKnownProcess >> allowDebug: aBoolean [

	allowDebug := aBoolean
]

{ #category : 'testing' }
StWellKnownProcess >> allowStop [

	^ allowStop
]

{ #category : 'accessing' }
StWellKnownProcess >> allowStop: aBoolean [

	allowStop := aBoolean
]

{ #category : 'accessing' }
StWellKnownProcess >> definition [

	^ definitionBlock
]

{ #category : 'accessing' }
StWellKnownProcess >> definition: aBlock [

	definitionBlock := aBlock
]

{ #category : 'accessing' }
StWellKnownProcess >> label [

	^ label ifNil: [ self definition asString lines first ]
]

{ #category : 'accessing' }
StWellKnownProcess >> label: aString [

	label := aString
]

{ #category : 'testing' }
StWellKnownProcess >> matchesProcess: aProcess [

	^ self definition value = aProcess
]

{ #category : 'accessing' }
StWellKnownProcess >> rules [

	^ {
	self label ifNil: [ self definition value suspendedContext asString ].
	self allowStop.
	self allowDebug
	}
]
