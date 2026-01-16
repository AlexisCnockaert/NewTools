"
I'm a modification binding command.
I will open the modificationBinding presenter.
"
Class {
	#name : 'StPlaygroundCommandModificationBinding',
	#superclass : 'StPlaygroundCommand',
	#category : 'NewTools-Playground-Command',
	#package : 'NewTools-Playground',
	#tag : 'Command'
}

{ #category : 'default' }
StPlaygroundCommandModificationBinding class >> defaultDescription [ 
	^ 'change the name and the value of a binding'
]

{ #category : 'default' }
StPlaygroundCommandModificationBinding class >> defaultIconName [ 
	^ #edit
]

{ #category : 'default' }
StPlaygroundCommandModificationBinding class >> defaultName [ 
	^ 'modif binding'
]

{ #category : 'executing' }
StPlaygroundCommandModificationBinding >> execute [ 
	(StPlaygroundBindingModification
		model: context)
		open
]
