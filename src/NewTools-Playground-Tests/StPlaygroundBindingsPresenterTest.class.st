Class {
	#name : 'StPlaygroundBindingsPresenterTest',
	#superclass : 'StPlaygroundBaseTest',
	#instVars : [
		'owner'
	],
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'accessing' }
StPlaygroundBindingsPresenterTest >> classToTest [

	^ StPlaygroundBindingsPresenter.
]

{ #category : 'running' }
StPlaygroundBindingsPresenterTest >> setUp [
	super setUp.

	owner := StPlaygroundPagePresenter new.
	owner interactionModel addBindingNamed: #this with: 0.
	presenter := ((self classToTest) 
		newApplication: owner application 
		model: owner)
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testInit [

	self assert: presenter isNotNil.
	self assert: (presenter isKindOf: self classToTest )
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testIsLocalBinding [
	|selected|
	owner text interactionModel addBindingNamed: #this with: 0.
	presenter selectedBindingIsLocal ifFalse: [ presenter moveSelectedBindingToLocalScope ].
	
	
	selected := presenter selectedBinding.
	self assert: (presenter isLocalBinding: selected).
	
	presenter moveSelectedBindingToSharedScope.
	
	selected := presenter selectedBinding.
	self deny: (presenter isLocalBinding: selected). 
	
	presenter moveSelectedBindingToLocalScope.
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testMoveSelectedBindingToLocalScope [
	
	presenter selectedBindingIsLocal ifTrue: [ presenter moveSelectedBindingToSharedScope ].
	
	self deny: presenter selectedBindingIsLocal.
	
	presenter moveSelectedBindingToLocalScope.
	
	self assert: presenter selectedBindingIsLocal.
	
	
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testMoveSelectedBindingToSharedScope [
	
	presenter selectedBindingIsLocal ifFalse: [ presenter moveSelectedBindingToLocalScope ].
	
	self assert: presenter selectedBindingIsLocal.
	
	presenter moveSelectedBindingToSharedScope .
	
	self deny: presenter selectedBindingIsLocal.
	
	presenter moveSelectedBindingToLocalScope.
	
	
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testRemoveAllBindings [
	|bindings|
	presenter selectedBindingIsLocal ifFalse: [ presenter moveSelectedBindingToLocalScope ].
	
	bindings := presenter bindings.
	bindings keysDo: [:key | self assert: (owner interactionModel hasBindingOf: key)].
	
	presenter removeAllBindings.
	
	bindings keysDo: [:key | self assert: (owner interactionModel hasBindingOf: key)]. 
	
	owner interactionModel addBindings: bindings.
	
	bindings := presenter bindings.
	bindings keysDo: [:key | self assert: (owner interactionModel hasBindingOf: key)].
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testRemoveSelectedBinding [
	|selected|
	selected := presenter selectedBinding.
	self assert: (owner interactionModel hasBindingOf: selected key).

	presenter removeSelectedBinding.
	
	self deny: (owner interactionModel hasBindingOf: selected key).

]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testScopeNameFor [
	|selected|
	
	presenter selectedBindingIsLocal ifFalse: [ presenter moveSelectedBindingToLocalScope ].
	
	selected := presenter selectedBinding. 
	
	self assert: (presenter scopeNameFor: selected) equals: 'local'.
	
	presenter moveSelectedBindingToSharedScope.
	selected := presenter selectedBinding.
	self assert: (selected key) equals: 'this'.
	
	self assert: (presenter scopeNameFor: selected) equals: 'shared'.
	
	presenter moveSelectedBindingToLocalScope.
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testSelectedBinding [
	|selected|
	
	selected := presenter selectedBinding.
	
	self assert: (selected isKindOf: WorkspaceVariable).
	self assert: selected key equals: #this .
]

{ #category : 'tests' }
StPlaygroundBindingsPresenterTest >> testSelectedBindingIsLocal [
	|selected|
	presenter selectedBindingIsLocal ifFalse: [ presenter moveSelectedBindingToLocalScope ].
	
	selected := presenter selectedBinding.
	self assert: presenter selectedBindingIsLocal.
	
	presenter moveSelectedBindingToSharedScope.
	
	selected := presenter selectedBinding.
	self deny: presenter selectedBindingIsLocal. 
	
	presenter moveSelectedBindingToLocalScope.
]
