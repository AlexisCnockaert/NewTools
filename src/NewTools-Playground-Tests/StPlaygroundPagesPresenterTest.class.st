Class {
	#name : 'StPlaygroundPagesPresenterTest',
	#superclass : 'StPlaygroundBaseTest',
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'accessing' }
StPlaygroundPagesPresenterTest >> classToTest [

	^ StPlaygroundPagesPresenter
]

{ #category : 'initialization' }
StPlaygroundPagesPresenterTest >> initializeInstanceBeforeInitialization: aPresenter [

	aPresenter setModelBeforeInitialization: (StPlaygroundPresenter newApplication: application)
]

{ #category : 'initialization' }
StPlaygroundPagesPresenterTest >> initializeMemoryFileSystem: aFileSystem [

	aFileSystem / 'test1.ph' writeStreamDo: [ :stream | stream << '42 factorial' ].
	aFileSystem / 'test2.ph' writeStreamDo: [ :stream | 
		stream << '"Test'; cr.
		stream << 'Test 2"' ].
]

{ #category : 'running' }
StPlaygroundPagesPresenterTest >> setUp [ 
	super setUp.

	presenter initialize.
]

{ #category : 'tests' }
StPlaygroundPagesPresenterTest >> testLoadPage [
	| loaded |

	loaded := false.
	self deny: presenter window isNotNil.
	self openInstance.
	self assert: presenter window isOpen.
	presenter onLoadPage: [ :aPage | loaded := true ].
	presenter loadPage: (StPlaygroundPage fromReference: (memoryFileSystem / 'test1.ph')).
	self deny: presenter window isOpen .
	self assert: loaded
]

{ #category : 'tests' }
StPlaygroundPagesPresenterTest >> testOnLoadPage [

	| ref page|

	self openInstance.
	
	ref := 'hello world'.
	page := self newPage.
	page contents: ref.
	page flush.
	
	self assert: page contents equals: ref.
	presenter onLoadPage: [ :pageBlock | pageBlock contents:'test' ; flush ].

	
	presenter loadPage: page.
	self deny: page contents equals: ref.
	self assert: page contents equals: 'test'.
]
