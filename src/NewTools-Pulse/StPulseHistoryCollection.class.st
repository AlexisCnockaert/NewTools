"
This class is a collection to store history of the usage of StPulse.

It stores the entries in a OrderedCollection and makes it circular. Every time it is pulled, if either the entry or the content of the entry is nil, it is removed from the list.

WeakOrderedCollection is not used due that the item that is used is not the original entry, and as such it doesn't have any other reference to it (It is also done this way to evade making hard references to entries)
"
Class {
	#name : 'StPulseHistoryCollection',
	#superclass : 'Object',
	#instVars : [
		'maxEntries',
		'entries'
	],
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'instance creation' }
StPulseHistoryCollection class >> new: anInteger [

	^ self new 
		maxEntries: anInteger ;
		yourself
]

{ #category : 'accessing' }
StPulseHistoryCollection >> add: aStEntry [

	self entries size < self maxEntries
		ifFalse: [ entries removeLast ].
	self remove: aStEntry.
	entries addFirst: aStEntry

]

{ #category : 'private - accessing' }
StPulseHistoryCollection >> basicEntries [

	^ entries ifNil: [ 
		entries := WeakOrderedCollection new ]
]

{ #category : 'accessing' }
StPulseHistoryCollection >> clean [

	entries ifNil: [ ^ self ]. 
	entries := entries select: [ :each | 
		each isNotNil 
		and: each content isNotNil ]
]

{ #category : 'accessing' }
StPulseHistoryCollection >> entries [ 

	^ entries 
		ifNil: [ entries := OrderedCollection new]
		ifNotNil: [ 
			self clean. 
			entries ]



]

{ #category : 'accessing' }
StPulseHistoryCollection >> maxEntries [
"The default value of maxEntries is 25"
	^ maxEntries ifNil: [ maxEntries := 25 ]
]

{ #category : 'accessing' }
StPulseHistoryCollection >> maxEntries: anInteger [

	maxEntries := anInteger
]

{ #category : 'accessing' }
StPulseHistoryCollection >> remove: aStEntry [

	entries removeAllSuchThat: [ :each | 
		each isNil 
		or: [ each contentString = aStEntry contentString 
		or: [ each contentString isNil ] ] ]
]

{ #category : 'private - accessing' }
StPulseHistoryCollection >> reset [

	entries := nil.
	maxEntries := nil.
]
