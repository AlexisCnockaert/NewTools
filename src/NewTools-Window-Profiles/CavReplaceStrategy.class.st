"
I'm a strategy that replaces the previous window that was in the placeholder by a new one!
I automatically close the previous one. 

It only work if the window has the exact same size and position as the placeholder registered.
"
Class {
	#name : 'CavReplaceStrategy',
	#superclass : 'CavWindowStrategy',
	#category : 'NewTools-Window-Profiles-Model',
	#package : 'NewTools-Window-Profiles',
	#tag : 'Model'
}

{ #category : 'accessing' }
CavReplaceStrategy class >> title [

	^ 'Replace at Location Strategy'
]

{ #category : 'positioning' }
CavReplaceStrategy >> placePresenter: aPresenter [

	super placePresenter: aPresenter.
	aPresenter position: placeHolder position.
	aPresenter extent: placeHolder extent.
	"do we keep a reference to the window from the placeholder?
	this way we could avoid to scan all the window."

	(SystemWindow allInstances select: [ :each |
			 each position = placeHolder position and: [
				 placeHolder kind = aPresenter class ] ]) do: [ :each |
		each delete ].
	(SpWindowMorph allInstances select: [ :each |
			 each position = placeHolder position and: [
				 placeHolder kind = aPresenter class ] ]) do: [ :each |
		each delete ]
]
