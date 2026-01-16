Class {
	#name : 'CavroisWindowPlaceHolderTest',
	#superclass : 'TestCase',
	#category : 'NewTools-Window-Profiles-Tests',
	#package : 'NewTools-Window-Profiles-Tests'
}

{ #category : 'tests' }
CavroisWindowPlaceHolderTest >> testHolderStrategyBackLink [


	| h |
	h := CavWindowPlaceHolder new.
	self assert: h strategy placeHolder equals: h 
]

{ #category : 'tests' }
CavroisWindowPlaceHolderTest >> testHolderStrategyBackLinkIsKeptOnSetter [


	| h |
	h := CavWindowPlaceHolder new. 
	h strategy: CavReplaceStrategy new. 
	self assert: h strategy placeHolder equals: h 
]
