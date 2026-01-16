Class {
	#name : 'CavWindowStrategy',
	#superclass : 'Object',
	#instVars : [
		'placeHolder'
	],
	#category : 'NewTools-Window-Profiles-Model',
	#package : 'NewTools-Window-Profiles',
	#tag : 'Model'
}

{ #category : 'accessing' }
CavWindowStrategy class >> title [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CavWindowStrategy >> placeHolder [

	^ placeHolder
]

{ #category : 'accessing' }
CavWindowStrategy >> placeHolder: anObject [

	placeHolder := anObject
]

{ #category : 'positioning' }
CavWindowStrategy >> placePresenter: aPresenter [

	aPresenter isSystemWindow
		ifTrue: [
				(self placeHolder windows includes: aPresenter) ifFalse: [
					self placeHolder windows add: aPresenter ] ]
		ifFalse: [
				aPresenter whenBuiltDo: [
						(self placeHolder windows includes: aPresenter owner window)
							ifFalse: [
							self placeHolder windows add: aPresenter owner window ] ] ]
]
