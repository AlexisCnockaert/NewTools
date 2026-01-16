"
A StRewriteCritiqueChangesBrowserPresenterTest is a test class for testing the behavior of StRewriteCritiqueChangesBrowserPresenter
"
Class {
	#name : 'StRewriteCritiqueChangesBrowserPresenterTest',
	#superclass : 'TestCase',
	#category : 'NewTools-CodeCritiques-Tests-Transform ',
	#package : 'NewTools-CodeCritiques-Tests',
	#tag : 'Transform '
}

{ #category : 'tests' }
StRewriteCritiqueChangesBrowserPresenterTest >> testSmoke [

	| window presenter |
	presenter := StRewriteCritiqueChangesBrowserPresenter.
	[ self shouldnt: [ window := presenter open ] raise: Error ] ensure: [ window ifNotNil: [ window close ] ]
]
