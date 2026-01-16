"
a ProfStef Playground with some specific abilities
"
Class {
	#name : 'StProfStefPlayground',
	#superclass : 'StPlaygroundPresenter',
	#category : 'ProfStef-Core-Presenter',
	#package : 'ProfStef-Core',
	#tag : 'Presenter'
}

{ #category : 'private - factory' }
StProfStefPlayground >> newDefaultPlaygroundPage [

	^ StProfStefPlaygroundPageModel new
]

{ #category : 'initialization' }
StProfStefPlayground >> windowTitle [
	^ 'Prof Stef'
]
