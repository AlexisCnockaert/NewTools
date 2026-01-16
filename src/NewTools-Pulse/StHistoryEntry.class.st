"
I wrap an Enviroment entry (Classes, Methods and Packages), and then I'm stored in StPulseHistoryCollection.
Each of the classes that inherits from me should define its behavior when being used, as the idea is to instead of storing the object, store a string that later allows you to reconstruct the object, thus evading leaks and hard references.
"
Class {
	#name : 'StHistoryEntry',
	#superclass : 'StEntry',
	#category : 'NewTools-Pulse-Entries',
	#package : 'NewTools-Pulse',
	#tag : 'Entries'
}

{ #category : 'instance creation' }
StHistoryEntry class >> new [ 

	self error: 'This class is abstract. Use his children'
]

{ #category : 'converting' }
StHistoryEntry >> asHistoryEntry [

	^ self
]

{ #category : 'accessing' }
StHistoryEntry >> categoryLabel [

	^ 'history'
]

{ #category : 'accessing' }
StHistoryEntry >> content [

	self subclassResponsibility
]

{ #category : 'accessing' }
StHistoryEntry >> contentString [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
StHistoryEntry >> isAbtract [ 

	^ true
]
