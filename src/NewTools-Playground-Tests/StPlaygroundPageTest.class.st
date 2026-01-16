Class {
	#name : 'StPlaygroundPageTest',
	#superclass : 'TestCase',
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'instance creation' }
StPlaygroundPageTest >> dateAroundToSecond:aDateAndTime [
	^ aDateAndTime hour asString, 'h-', aDateAndTime minute asString, 'min ', aDateAndTime second asString , 's'
]

{ #category : 'instance creation' }
StPlaygroundPageTest >> newPage [ 

	^ StPlaygroundPage new 
		baseDirectory: FileSystem memory;
		timeToWait: 10 milliSeconds;
		yourself
]

{ #category : 'tests' }
StPlaygroundPageTest >> testBasicContents [
	| page string |

	page := self newPage.
	string := 'test'.
	
	self assert: page contents equals: ''.
	
	page basicContents: string.
	page flush.
	
	self assert: page contents equals: string.
		
]

{ #category : 'tests' }
StPlaygroundPageTest >> testContents [
	| page waitMock |
	
	self skipOnPharoCITestingEnvironment.
	
	page := self newPage.
	waitMock := StPlaygroundPageTestMockedWaitable new.
	page timeToWait: waitMock.
	page contents: 'test'.
	self assert: page contents isEmpty.
	page contents: 'test 2'.
	self assert: page contents isEmpty.
	waitMock resume.
	self assert: page contents equals: 'test 2'
]

{ #category : 'tests' }
StPlaygroundPageTest >> testCreationTime [ 
	|page|
	page := self newPage.
	
	self assert: (self dateAroundToSecond: page creationTime) equals: (self dateAroundToSecond: DateAndTime now).
]

{ #category : 'tests' }
StPlaygroundPageTest >> testDoNotStoreVersionIfEqual [
	| v1 page |
	
	v1 := 'v1'.
	page := self newPage.
	page basicContents: v1.
	page flush.
	"Execute twice with same content"
	page storeVersion.
	
	self deny: page versions isEmpty.
	self assert: page versions size equals: 1
]

{ #category : 'tests' }
StPlaygroundPageTest >> testEnsureContentsFlushed [
	|page|
	page := self newPage.
	
	self assert: page contents equals: ''.
	page contents: 'coucou'.
	page ensureContentsFlushed.
	
	self assert: page contents equals: 'coucou'.
]

{ #category : 'tests' }
StPlaygroundPageTest >> testFlush [
	| page |
	
	page := self newPage.
	page basicContents: 'test'.

	self assertEmpty: page.
	
	page flush.
	
	self assert: page contents equals: 'test'
	
]

{ #category : 'tests' }
StPlaygroundPageTest >> testFromReference [
	| memory file page |
	
	memory := FileSystem memory.
	file := memory / 'test.ph'.
	file writeStreamDo: [ :stream | stream << 'TEST'].
	
	page := StPlaygroundPage fromReference: file. 
	self assert: page fileReference equals: file.

]

{ #category : 'tests' }
StPlaygroundPageTest >> testIsEmpty [ 
	|page|
	page := self newPage .
	
	self assertEmpty: page.
	page contents: 'coucou'.
	page flush.
	self deny: page isEmpty.
]

{ #category : 'tests' }
StPlaygroundPageTest >> testModificationTime [
	|page|
	page := self newPage.
	
	
	self assert: (self dateAroundToSecond: page modificationTime) equals: (self dateAroundToSecond: DateAndTime now).
	
	page contents: 'coucou'.
	page flush.
	
	self assert: (self dateAroundToSecond: page modificationTime) equals: (self dateAroundToSecond: DateAndTime now).
]

{ #category : 'tests' }
StPlaygroundPageTest >> testOnFlush [
	|page function test|
	page := self newPage .
	test := 0.
	function := [ test := 3 ].
	
	page onFlush: function.
	
	self assert: test equals: 0.
	page contents: 'coucou'.
	page flush.
	self assert: test equals: 3.
	
	
]

{ #category : 'tests' }
StPlaygroundPageTest >> testStoreVersion [
	| v1 page |
	
	v1 := 'v1'.
	page := self newPage.
	page basicContents: v1.
	page flush.
	self deny: page versions isEmpty.
	self assert: page versions first content equals: v1
]

{ #category : 'tests' }
StPlaygroundPageTest >> testTouch [
	|page|
	page := self newPage.
	
	self assert: (self dateAroundToSecond: page modificationTime) equals: (self dateAroundToSecond: DateAndTime now).
	page touch.
	self assert: (self dateAroundToSecond: page modificationTime) equals: (self dateAroundToSecond: DateAndTime now).
]

{ #category : 'tests' }
StPlaygroundPageTest >> testVersions [
	| v1 v2 v3 page |
	
	v1 := 'v1'.
	v2 := 'v2'.
	v3 := 'v3'.
	
	page := StPlaygroundPage new.
	
	page basicContents: v1.
	page flush.
	
	page basicContents: v2.
	page flush.
	
	page basicContents: v3.
	page flush.
	
	self assert: page versions size equals: 3.
	self assert: page versions first content equals: v1.
	self assert: page versions second content equals: v2.	
	self assert: page versions third content equals: v3
]
