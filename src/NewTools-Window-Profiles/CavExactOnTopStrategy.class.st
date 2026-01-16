"
I am a strategy that positions the new window at the placeholder's extent and position, stacking it on top of previous window(s) on the placeholder if one was already present.

"
Class {
	#name : 'CavExactOnTopStrategy',
	#superclass : 'CavWindowStrategy',
	#category : 'NewTools-Window-Profiles-Model',
	#package : 'NewTools-Window-Profiles',
	#tag : 'Model'
}

{ #category : 'accessing' }
CavExactOnTopStrategy class >> title [

	^ 'Exact on Top Strategy'
]

{ #category : 'positioning' }
CavExactOnTopStrategy >> placePresenter: aWindow [

	super placePresenter: aWindow.
	aWindow position: placeHolder position.
	aWindow extent: placeHolder extent
]
