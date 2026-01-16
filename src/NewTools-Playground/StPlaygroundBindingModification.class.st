"
I am a presenter where you can midify a bindings of parent Playground.
you can put the name of the binding and the value of this binding.
"
Class {
	#name : 'StPlaygroundBindingModification',
	#superclass : 'StPlaygroundBindingPresenter',
	#instVars : [
		'oldBinding'
	],
	#category : 'NewTools-Playground-View',
	#package : 'NewTools-Playground',
	#tag : 'View'
}

{ #category : 'accessing' }
StPlaygroundBindingModification class >> model: aModelPresenter [
	^ self basicNew 
		interactionModel: aModelPresenter parent interactionModel;
		setModelBeforeInitialization: aModelPresenter;
		oldBinding: aModelPresenter selectedBinding;
		initialize
]

{ #category : 'actions' }
StPlaygroundBindingModification >> buttonAction [
	|test|	
		bindingName text ifEmpty: [ self error: 'I need a string to by identify' . ^ nil ].
		bindingValue text ifEmpty: [ self error: 'I need a value' . ^ nil  ].
		


		test := bindingValue evaluate: bindingValue text onCompileError: [ ^ self ] onError: [ :e | ^ self ]. 		
		self flag: #nil. "if you compile and you get an error like (Array new) @ 1 test gone to be nil
		so did we need this (next line)
		test ifNil: [ self error:'you got an error in your binding value'. ^ nil ]."
		
		interactionModel removeBindingNamed: oldBinding key.
		interactionModel addBindingNamed: bindingName text with: test.
		
		parent updatePresenterKeepingSelection.
		self delete
]

{ #category : 'initialization' }
StPlaygroundBindingModification >> initializeTextInput [
	super initializeTextInput.
	bindingName text: oldBinding key
]

{ #category : 'accessing' }
StPlaygroundBindingModification >> nameButton [
	^ 'Modification'
]

{ #category : 'accessing' }
StPlaygroundBindingModification >> oldBinding: aBinding [
	aBinding ifNil: [ self error: 'you can''t ' , 'change a nil binding'. self delete.  ].
	oldBinding := aBinding
]

{ #category : 'accessing' }
StPlaygroundBindingModification >> windowTitle [ 
	^ 'Modification of ' , oldBinding key
]
