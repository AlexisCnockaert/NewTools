"
I'm a strategy that has a counter used for having a stack of window with the placeholder position at start point.

I should be modified to have a maximum stacking size because i can place my window out of the screen
"
Class {
	#name : 'CavStackingStrategy',
	#superclass : 'CavWindowStrategy',
	#category : 'NewTools-Window-Profiles-Model',
	#package : 'NewTools-Window-Profiles',
	#tag : 'Model'
}

{ #category : 'accessing' }
CavStackingStrategy class >> title [

	^ 'Stacking Strategy'
]

{ #category : 'positioning' }
CavStackingStrategy >> placePresenter: aPresenter [

	super placePresenter: aPresenter.
	aPresenter extent: placeHolder extent.

	aPresenter position:
		placeHolder position + (20 @ 20 * placeHolder count).
	placeHolder count < 4
		ifTrue: [ placeHolder increment ]
		ifFalse: [ placeHolder count: 1 ]
]
