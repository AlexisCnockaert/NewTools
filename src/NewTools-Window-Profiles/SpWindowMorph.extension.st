Extension { #name : 'SpWindowMorph' }

{ #category : '*NewTools-Window-Profiles' }
SpWindowMorph >> configurePlaceHolder: aPlaceHolder [
	
	aPlaceHolder kind: self model presenter class 
]

{ #category : '*NewTools-Window-Profiles' }
SpWindowMorph >> position: aNewPosition [

	super position: aNewPosition.
	model ifNotNil: [ model position: aNewPosition ]
]
