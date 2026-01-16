Class {
	#name : 'StPulseHistoryCollectionTest',
	#superclass : 'TestCase',
	#instVars : [
		'collection'
	],
	#category : 'NewTools-Pulse-Tests',
	#package : 'NewTools-Pulse-Tests'
}

{ #category : 'running' }
StPulseHistoryCollectionTest >> setUp [

	super setUp.
	collection := StPulseHistoryCollection new: 25.
	
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> tearDown [ 

	collection := nil.
	super tearDown
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testAdd [
	
	| entry1 entry2 |	
		
	entry1 := (StClassEntry on: self class) asHistoryEntry.
	entry2 := (StMethodEntry on: self) asHistoryEntry.

	collection add: entry1.
	self assert: collection entries first equals: entry1.
	collection add: entry2.
	self assert: collection entries first equals: entry2
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testBasicEntries [
	
	| entry |

	entry := StClassEntry on: 'entry'.
	collection add: entry.
	self assert: collection entries size equals: 1.
	entry content: nil.
	self assert: collection basicEntries first equals: entry
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testClean [
	
	| entry |

	entry := (StMethodEntry on: 'entry') asHistoryEntry.
	collection add: entry.
	self assert: collection entries first equals: entry.
	entry content: nil.
	3 timesRepeat: [Smalltalk garbageCollect].
	self assert: collection entries size equals: 0
	
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testEntries [
	
	| entry1 |

	entry1 := StClassEntry new content: 'entry1'.
	self assert: collection entries isNotNil.
	collection add: entry1.
	self assert: collection entries size equals: 1.
	entry1 content: nil.
	self assert: collection entries size equals: 0
	
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testEntryUnderstandContentString [ 
	
	| entry1 |

	entry1 := StClassEntry new content: 'entry1'.
	self assert: entry1 contentString equals: 'entry1'
	
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testMaxEntries [
	
	| entry1 entry2 |

	entry1 := StClassEntry new content: 'entry1'.
	entry2 := StClassEntry new content: 'entry2'.
	collection maxEntries: 1.
	collection add: entry1.
	self assert: collection entries first content equals: 'entry1'.
	collection add: entry2.
	self assert: collection entries first content equals: 'entry2'
	
]

{ #category : 'running' }
StPulseHistoryCollectionTest >> testRemove [
	
	| entry |

	entry := (StClassEntry on: self class) asHistoryEntry.
	collection add: entry.
	self assert: collection entries size equals: 1.
	collection add: entry.
	self assert: collection entries size equals: 1.
	collection remove: entry.
	self assert: collection entries size equals: 0.
	
]
