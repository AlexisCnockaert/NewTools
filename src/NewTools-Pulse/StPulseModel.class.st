"
This is the model used in StPulse. 

whenCandidateAddedDo event is to give access to the added candidates to StPulse. See StPulse >> initialize for more info.
"
Class {
	#name : 'StPulseModel',
	#superclass : 'Object',
	#instVars : [
		'candidateAddedAction'
	],
	#category : 'NewTools-Pulse-Model',
	#package : 'NewTools-Pulse',
	#tag : 'Model'
}

{ #category : 'private' }
StPulseModel >> allCandidatesFor: text inContext: aDockSpotterContext [
	"contextSymbol can be #environment, #editors, #tools"
	| candidateList stream context processor |
	
	candidateList := StSpotterCandidatesList new.
	candidateList announcer when: StSpotterCandidateAdded send: #candidateAdded: to: self.
	stream := StSpotterStream new 
		onAddedSelector: #addCandidate:in:;
		receiver: candidateList;
		yourself.

	context:= StSpotterContext new 
		step: self;
		stream: stream;
		text: text;
		search: text;
		yourself.

	(self processorsForContext: aDockSpotterContext) do: [ :each |
		processor := each new.
		processor filterAllInContext: context ].
	^ candidateList candidates asArray
]

{ #category : 'private' }
StPulseModel >> candidateAdded: ann [

	candidateAddedAction ifNil: [ ^ self ].
	candidateAddedAction value: ann candidate
]

{ #category : 'private' }
StPulseModel >> candidatesFor: text inContext: aDockSpotterContext [
	"contextSymbol can be #environment, #editors, #tools"
	| candidateList stream context processor |
	
	candidateList := StSpotterCandidatesList new.
	candidateList announcer when: StSpotterCandidateAdded send: #candidateAdded: to: self.
	stream := StSpotterStream new 
		onAddedSelector: #addCandidate:in:;
		receiver: candidateList;
		yourself.

	context:= StSpotterContext new 
		step: self;
		stream: stream;
		text: text;
		search: text;
		yourself.

	(self processorsForContext: aDockSpotterContext) do: [ :each |
		processor := each new.
		processor filterInContext: context ].
	^ candidateList candidates asArray
]

{ #category : 'private' }
StPulseModel >> processorsForContext: aContext [

	^ aContext associatedProcessors
]

{ #category : 'private' }
StPulseModel >> whenCandidateAddedDo: aBlock [

	candidateAddedAction := aBlock
]
