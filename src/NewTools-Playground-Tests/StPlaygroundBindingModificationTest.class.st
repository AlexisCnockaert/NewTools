Class {
	#name : 'StPlaygroundBindingModificationTest',
	#superclass : 'StPlaygroundBaseTest',
	#instVars : [
		'owner',
		'playground'
	],
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'accessing' }
StPlaygroundBindingModificationTest >> classToTest [

	^ StPlaygroundBindingModification
]

{ #category : 'running' }
StPlaygroundBindingModificationTest >> setUp [
	super setUp.
	playground := StPlaygroundPagePresenter new.
	playground interactionModel addBindingNamed: #this with: 0.
	
	owner := (StPlaygroundBindingsPresenter 
		newApplication: playground application 
		model: playground).
		
	presenter := self classToTest model: owner 
]

{ #category : 'tests' }
StPlaygroundBindingModificationTest >> testButtonAction [
	|interactionModel|
	interactionModel := playground interactionModel.
	
	self assert: (interactionModel hasBindingOf: #this).
	self assert: presenter bindingName text equals: 'this'.
	
	presenter bindingValue text: '''coucou'''.
	
	presenter buttonAction.
	
	self assert: (interactionModel hasBindingOf: #this).
	self assert: ((interactionModel bindingOf: #this) value ) equals: 'coucou'
]

{ #category : 'tests' }
StPlaygroundBindingModificationTest >> testButtonActionWithError [
	|interactionModel|
	interactionModel := playground interactionModel.
	
	self assert: (interactionModel hasBindingOf: #this).
	self assert: presenter bindingName text equals: 'this'.
	
	
	self executeShould: [ presenter buttonAction ] inScopeOf: Error.
	presenter bindingName text: 'something'.
	
	self executeShould: [ presenter buttonAction ] inScopeOf: Error.
	presenter bindingValue text: '''something'''.
	
	presenter buttonAction.
	
	self assert: (interactionModel hasBindingOf: #something).
	self assert: ((interactionModel bindingOf: #something) value ) equals: 'something'

]
