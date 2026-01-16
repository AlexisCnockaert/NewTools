Class {
	#name : 'CavWindowProfileTest',
	#superclass : 'TestCase',
	#category : 'NewTools-Window-Profiles-Tests',
	#package : 'NewTools-Window-Profiles-Tests'
}

{ #category : 'tests' }
CavWindowProfileTest >> testNoPlaceHolder [

	| profile |
	profile := CavWindowProfile new. 
	self deny: (profile hasPlaceHolderFor: 'IceTipRepositoriesBrowser')
]

{ #category : 'tests' }
CavWindowProfileTest >> testNoPlaceHolderReturnANullPlaceHolder [

	| profile placeHolders |
	profile := CavWindowProfile new. 
	placeHolders :=  profile placeHoldersFor: 'IceTipRepositoriesBrowser@@@'.
	self assert: placeHolders first class equals: CavNullWindowPlaceHolder 
]

{ #category : 'tests' }
CavWindowProfileTest >> testTwoDifferentPlaceHolders [

	| profile |
	profile := CavWindowProfile new. 
	profile add: (CavWindowPlaceHolder new kind: 'IceTipRepositoriesBrowser'; yourself).
	profile add: (CavWindowPlaceHolder new kind: 'StPlaygroundPresenter'; yourself).
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') isNotEmpty.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') first class equals: CavWindowPlaceHolder.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') first kind equals: 'IceTipRepositoriesBrowser'.
]

{ #category : 'tests' }
CavWindowProfileTest >> testTwoPlaceHoldersOfTheSameKind [

	| profile |
	profile := CavWindowProfile new. 
	profile add: (CavWindowPlaceHolder new kind: 'IceTipRepositoriesBrowser'; position: 10@10; yourself).
	profile add: (CavWindowPlaceHolder new kind: 'IceTipRepositoriesBrowser'; position: 100@100;  yourself).
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') isNotEmpty.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') size equals: 2.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') first class equals: CavWindowPlaceHolder.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') first kind equals: 'IceTipRepositoriesBrowser'.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') first position equals: 10@10.
	self assert: (profile placeHoldersFor: 'IceTipRepositoriesBrowser') second position equals: 100@100.
]
