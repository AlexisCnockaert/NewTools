"
Row presenter for StPulse list presenter.
"
Class {
	#name : 'StPulseRowPresenter',
	#superclass : 'SpEasyAbstractRowPresenter',
	#instVars : [
		'iconPresenter',
		'namePresenter',
		'contextPresenter'
	],
	#category : 'NewTools-Pulse-View',
	#package : 'NewTools-Pulse',
	#tag : 'View'
}

{ #category : 'layout' }
StPulseRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 5;
		borderWidth: 2;
		add: iconPresenter expand: false;
		add: namePresenter;
		add: contextPresenter expand: false;
		yourself
]

{ #category : 'initialization' }
StPulseRowPresenter >> initializePresenters [

"	self addStyle: 'stRow'.
	self addStyle: 'stPulseRow'."
	
	iconPresenter := self newImage.
	namePresenter := self newLabel
		addStyle: 'stPulseRowText';
		yourself.
	contextPresenter := self newLabel
		addStyle: 'dim';
		addStyle: 'tinyFont';
		yourself
	
]

{ #category : 'initialization' }
StPulseRowPresenter >> updatePresenter [

	self model ifNil: [ ^ self ].
	
	iconPresenter image: (self model iconOn: self application).
	namePresenter label: self model label.
	contextPresenter label: self model categoryLabel
]
