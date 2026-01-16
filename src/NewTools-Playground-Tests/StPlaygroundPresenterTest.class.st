Class {
	#name : 'StPlaygroundPresenterTest',
	#superclass : 'StPlaygroundBaseTest',
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'running' }
StPlaygroundPresenterTest >> classToTest [

	^ StPlaygroundPresenter
]

{ #category : 'running' }
StPlaygroundPresenterTest >> initializeInstanceBeforeInitialization: aPresenter [

	aPresenter setModelBeforeInitialization: self newPage
]

{ #category : 'instance creation' }
StPlaygroundPresenterTest >> newPlayground [

	^ StPlaygroundPresenter 
		newApplication: application
		model: self newPage
		
]

{ #category : 'running' }
StPlaygroundPresenterTest >> setUp [ 
	super setUp.

	presenter initialize.
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testContents [

	presenter open.
	self waitUntilUIRedrawed.
	presenter contents: 'Test'.
	presenter page flush.
	self assert: presenter model contents equals: 'Test'
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testDefaultKeyboardFocus [ 
	|res|
	presenter open.
	self waitUntilUIRedrawed.

	res := presenter defaultKeyboardFocus.
	
	self assert: (res isKindOf: StPlaygroundPagePresenter)
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testLoadPage [

	| page |
	presenter open.
	self waitUntilUIRedrawed.
	presenter contents: 'Test 1'.
	presenter page flush.

	page := self newPage
		contents: 'Test 2';
		flush;
		yourself.
	presenter loadPage: page.
	self waitUntilUIRedrawed.
	self assert: presenter page contents equals: page contents
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testNewInspectorFor [
	|model res|
	presenter open.
	self waitUntilUIRedrawed.
	model := StPlaygroundInteractionModel new.
	
	res := presenter newInspectorFor: model.
	self assert: res owner equals: presenter.
	self assert: (res isKindOf: StObjectInspectorPresenter)
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testNewInspectorForWorksWhenModelIsNil [
	| inspectorPanel |

	inspectorPanel := presenter newInspectorFor: nil.
	self assert: inspectorPanel isNotNil.
	self assert: (inspectorPanel isKindOf: StObjectInspectorPresenter)
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testPage [
	|page1 page2|
	presenter open.
	self waitUntilUIRedrawed.
	
	page1 := self newPage contents: 'test'; flush ; yourself.
	page2 := self newPage contents: 'test33'; flush ; yourself.

	presenter loadPage: page1; loadPage: page2.
	
	self assert: presenter page equals: page2.
]

{ #category : 'tests' }
StPlaygroundPresenterTest >> testStopProcessing [

	| page |
	presenter open.
	self waitUntilUIRedrawed.
	page := self newPage
		        contents: 'Test 1';
		        flush;
		        yourself.
	presenter loadPage: page.
	self waitUntilUIRedrawed.
	"a lot of time"
	presenter page timeToWait: 1 minute.
	presenter contents: 'Test 2'.
	"no time to flush"
	self assert: page contents equals: 'Test 1'.
	"now we can close and test."
	presenter window close.
	self assert: page contents equals: 'Test 2'
]
