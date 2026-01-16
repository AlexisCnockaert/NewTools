Class {
	#name : 'StPlaygroundInteractionModelTest',
	#superclass : 'SpCodeScriptingInteractionModelTest',
	#instVars : [
		'application'
	],
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'instance creation' }
StPlaygroundInteractionModelTest >> newInteractionModel [

	^ StPlaygroundInteractionModel new
		owner: (StPlaygroundPresenter new
			application: application;
			yourself);
		yourself
]

{ #category : 'running' }
StPlaygroundInteractionModelTest >> setUp [
	super setUp.
	
	application := StPharoApplication new.
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testAddBinding [ 
	| im1 binding |
	
	im1 := self newInteractionModel.
	
	binding := WorkspaceVariable key: #testBinding value: 42.
	im1 addBinding: binding.
	
	self assert:(im1 hasBindingOf: #testBinding). 
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testAddBindingNamedWith [
	| im1 |
	
	im1 := self newInteractionModel.
	
	im1 addBindingNamed: 'theBestAnime' with: 86.
	
	self assert: (im1 hasBindingOf: #theBestAnime).
	self assert: (im1 bindingOf: #theBestAnime) value equals: 86.
	self deny: (im1 hasBindingOf: #bestAnime)
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testAddBindings [
	|im1 allBinding binding1 binding2|
	
	im1 := self newInteractionModel.
	
	binding1 := WorkspaceVariable key: #testBinding value: 42.
	binding2 := WorkspaceVariable key: #testBinding2 value: 43.
	
	allBinding := {binding1. binding2}.
	im1 addBindings: allBinding.
	
	allBinding do: [ :each | self assert: (im1 hasBindingOf: (each key)) ].
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testAddBindingsByDictionary [
	|im1 dico|
	
	im1 := self newInteractionModel.
	dico := Dictionary new.
	
	dico at: 'hello' put: 'world'.
	dico at: 'theBestAnime' put: 86.
	dico at: 'whereIsTheOnePiece' put: 300@300.

	im1 addBindingsByDictionary: dico.
	
	dico keysDo: [ :key | self assert: (im1 hasBindingOf: key) ].
	dico keysAndValuesDo: [ :key :value | self assert: (im1 bindingOf: key) value equals: value ].
	
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testBindingOf [ 
	|im1  binding1|
	
	im1 := self newInteractionModel.
	
	binding1 := WorkspaceVariable key: #testBinding value: 42.

	im1 addBinding: binding1.
	
	self assert: (im1 bindingOf: (binding1 key)) equals: binding1. 
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testHasBindingOf [ 
	|im1  binding1|
	
	im1 := self newInteractionModel.
	
	binding1 := WorkspaceVariable key: #testBinding value: 42.

	im1 addBinding: binding1.
	
	self assert: (im1 hasBindingOf: binding1 key).
	self deny: (im1 hasBindingOf: 'fail').
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testMakeBindingLocal [
	| im1 im2 binding |
	
	im1 := self newInteractionModel.
	im2 := self newInteractionModel.
	
	binding := WorkspaceVariable key: #testBinding value: 42.
	application addSharedBinding: binding.

	self assert: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self assert: (im2 hasBindingOf: #testBinding).
	
	im1 makeBindingLocal: binding.
	self deny: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self deny: (im2 hasBindingOf: #testBinding).
	
	im1 makeBindingShared: binding.
	
	self assert: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self assert: (im2 hasBindingOf: #testBinding).
	
	im1 makeBindingLocal: binding.
	self deny: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self deny: (im2 hasBindingOf: #testBinding).
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testMakeBindingShared [
	| im1 im2 binding |
	
	im1 := self newInteractionModel.
	im2 := self newInteractionModel.
	
	binding := WorkspaceVariable key: #testBinding value: 42.

	im1 addBinding: binding.
	self deny: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self deny: (im2 hasBindingOf: #testBinding).
	
	im1 makeBindingShared: binding.
	self assert: (application sharedBindings includesKey: #testBinding).
	self assert: (im1 hasBindingOf: #testBinding).
	self assert: (im2 hasBindingOf: #testBinding)
	
]

{ #category : 'tests' }
StPlaygroundInteractionModelTest >> testRemoveBindingNamed [
	|im1 dico|
	
	im1 := self newInteractionModel.
	dico := Dictionary new.
	
	dico at: 'hello' put: 'world'.
	dico at: 'theBestAnime' put: 86.
	dico at: 'whereIsTheOnePiece' put: 300@300.

	im1 addBindingsByDictionary: dico.
	
	dico keysDo: [ :key | self assert: (im1 hasBindingOf: key) ].
	dico keysAndValuesDo: [ :key :value | self assert: (im1 bindingOf: key) value equals: value ].
	
	im1 removeBindingNamed: #hello.
	
	self deny: (im1 hasBindingOf: #hello).
	
	im1 removeBindingNamed: 'whereIsTheOnePiece'. "because we don't know where it is"
	
	self deny: (im1 hasBindingOf: #whereIsTheOnePiece).
]
