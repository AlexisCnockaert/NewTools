"
I am a presenter where you can add a bindings of parent Playground.
you can put the name of the binding and the value of this binding.
"
Class {
	#name : 'StPlaygroundBindingAdd',
	#superclass : 'StPlaygroundBindingPresenter',
	#category : 'NewTools-Playground-View',
	#package : 'NewTools-Playground',
	#tag : 'View'
}

{ #category : 'actions' }
StPlaygroundBindingAdd >> buttonAction [
	|test|	
		
		bindingName text ifEmpty: [ self error: 'I need a string to by identify' . ^ nil ].
		bindingValue text ifEmpty: [ self error: 'I need a value' . ^ nil  ].


		test := bindingValue evaluate: bindingValue text onCompileError: [ ^ self ] onError: [ :e | ^ self ].
		self flag: #nil. "if you compile and you get an error like (Array new) @ 1' test gone to be nil
		so did we need this (next line)
		test ifNil: [ self error:'you got an error in your binding value'. ^ nil ]."
		
		
		interactionModel addBindingNamed: bindingName text with: test.
		parent updatePresenterKeepingSelection.
		self delete
]

{ #category : 'accessing' }
StPlaygroundBindingAdd >> nameButton [ 
	^ 'Add'
]

{ #category : 'accessing' }
StPlaygroundBindingAdd >> windowTitle [ 
	^ 'New binding'
]
