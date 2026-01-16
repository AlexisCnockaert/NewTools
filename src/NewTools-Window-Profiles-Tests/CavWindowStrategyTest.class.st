Class {
	#name : 'CavWindowStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'placeHolder'
	],
	#category : 'NewTools-Window-Profiles-Tests',
	#package : 'NewTools-Window-Profiles-Tests'
}

{ #category : 'running' }
CavWindowStrategyTest >> setUp [

	super setUp.
	presenter := SpPresenterForTestingCavrois new.
	presenter position: 10@10.
	self assert: presenter preferredExtent equals: 666@42.
	self assert: presenter position equals: 10@10.
	placeHolder := (CavWindowPlaceHolder new position: 101@101; extent: 100@200).
	
	
	
	
]

{ #category : 'tests' }
CavWindowStrategyTest >> testCascadingtrategyDoesNotChangeExtentAndPosition [

	| strategy |
	
	"In setUp
	placeHolder := (CavWindowPlaceHolder new position: 101@101; extent: 100@200).
	"
	
	strategy := CavStackingStrategy new.
	strategy placeHolder: placeHolder.
	strategy placePresenter: presenter.
	
	self assert: presenter extent equals: 100@200.
	self assert: presenter position equals: (101@101) + (20@20).
	
	strategy placePresenter: presenter.
	self assert: presenter extent equals: (100@200).
	self assert: presenter position equals: (101@101) + (40@40).
	
	
	

	
	
	
	
]

{ #category : 'tests' }
CavWindowStrategyTest >> testExactReplaceStrategyDoesNotChangeExtentAndPosition [

	| strategy |
	
	"In setUp
	placeHolder := (CavWindowPlaceHolder new position: 101@101; extent: 100@200).
	"
	self skip.
	self flag: #revisitAlexis.
	strategy := CavExactOnTopStrategy new.
	strategy placeHolder: placeHolder.
	strategy placePresenter: presenter.
	
	self assert: presenter extent equals: 100@200.
	self assert: presenter position equals: 101@101
	
	"we cannot test that if there was one window with the same presenter it got removed."
	

	

	
	
	
	
]

{ #category : 'tests' }
CavWindowStrategyTest >> testPopUpReplaceStrategyDoesNotChangeExtentAndPosition [

	| strategy |
	
	"In setUp
	placeHolder := (CavWindowPlaceHolder new position: 101@101; extent: 100@200).
	"
	
	strategy := CavReplaceStrategy new.
	strategy placeHolder: placeHolder.
	strategy placePresenter: presenter.
	
	self assert: presenter extent equals: 100@200.
	self assert: presenter position equals: 101@101
	
	"we do not test that if there was one window with the same presenter, the new one did not get 
	created at all but an old one is put on top."
	

	

	
	
	
	
]
