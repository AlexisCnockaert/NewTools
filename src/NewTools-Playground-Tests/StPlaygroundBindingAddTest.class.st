Class {
	#name : 'StPlaygroundBindingAddTest',
	#superclass : 'StPlaygroundBaseTest',
	#instVars : [
		'owner',
		'playground'
	],
	#category : 'NewTools-Playground-Tests',
	#package : 'NewTools-Playground-Tests'
}

{ #category : 'accessing' }
StPlaygroundBindingAddTest >> classToTest [

	^ StPlaygroundBindingAdd
]

{ #category : 'running' }
StPlaygroundBindingAddTest >> setUp [
	super setUp.
	"self halt."
	playground := StPlaygroundPagePresenter new.
	playground interactionModel addBindingNamed: #this with: 0.
	
	owner := (StPlaygroundBindingsPresenter 
		newApplication: playground application 
		model: playground).
		
	presenter := self classToTest model: owner 
]

{ #category : 'tests' }
StPlaygroundBindingAddTest >> testButtonAction [
	|interactionModel|
	interactionModel := playground interactionModel.
	
	self deny: (interactionModel hasBindingOf: #This).
	
	presenter bindingName text: 'This'.
	presenter bindingValue text: '''coucou'''.
	
	presenter buttonAction.
	
	self assert: (interactionModel hasBindingOf: #This).
	self assert: ((interactionModel bindingOf: #This) value ) equals: 'coucou'
]

{ #category : 'tests' }
StPlaygroundBindingAddTest >> testButtonActionWithError [
	|interactionModel|
	interactionModel := playground interactionModel.
	
	self executeShould: [ presenter buttonAction ] inScopeOf: Error.
	presenter bindingName text: 'something'.
	
	self executeShould: [ presenter buttonAction ] inScopeOf: Error.
	presenter bindingValue text: '''something'''.
	
	presenter buttonAction.
	
	self assert: (interactionModel hasBindingOf: #something).
	self assert: ((interactionModel bindingOf: #something) value ) equals: 'something'

]
