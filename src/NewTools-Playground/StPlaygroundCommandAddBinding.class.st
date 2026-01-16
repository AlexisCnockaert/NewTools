"
I'm a add binding command.
I will open the addBinding presenter.
"
Class {
	#name : 'StPlaygroundCommandAddBinding',
	#superclass : 'StPlaygroundCommand',
	#category : 'NewTools-Playground-Command',
	#package : 'NewTools-Playground',
	#tag : 'Command'
}

{ #category : 'default' }
StPlaygroundCommandAddBinding class >> defaultDescription [ 
	^ 'add a binding into the interaction model'
]

{ #category : 'default' }
StPlaygroundCommandAddBinding class >> defaultIconName [ 
	^ #add
]

{ #category : 'default' }
StPlaygroundCommandAddBinding class >> defaultName [ 
	^ 'add a binding'
]

{ #category : 'executing' }
StPlaygroundCommandAddBinding >> execute [ 
	(StPlaygroundBindingAdd
		model: context)
		open
]
