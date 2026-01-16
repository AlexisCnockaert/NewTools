Extension { #name : 'StWindowPresenter' }

{ #category : '*NewTools-Window-Profiles' }
StWindowPresenter >> openWith: aSpecLayout [

	CavroisWindowManager current currentProfile ifNotNil: [
			((CavroisWindowManager current currentProfile placeHoldersFor:
				  self presenter class) first isKindOf: CavNullWindowPlaceHolder)
				ifFalse: [
						CavroisWindowManager current placePresenter: self presenter.
						self initialPosition: self presenter position.
						self initialExtent: self presenter extent ] ].
	self isVisible ifTrue: [ self openWithLayout: aSpecLayout ]
]
