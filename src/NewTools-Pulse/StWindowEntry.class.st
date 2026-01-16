"
I wrap a Window, to modify its behavior if required for the spotter
"
Class {
	#name : 'StWindowEntry',
	#superclass : 'StEntry',
	#category : 'NewTools-Pulse-Entries',
	#package : 'NewTools-Pulse',
	#tag : 'Entries'
}

{ #category : 'converting' }
StWindowEntry >> asString [ 

	^ '{1} [{2}]' format: { content label. content className }
]

{ #category : 'accessing' }
StWindowEntry >> categoryLabel [

	^ 'window'
]

{ #category : 'evaluating' }
StWindowEntry >> doEvaluate [

	content stActDefault
]

{ #category : 'accessing' }
StWindowEntry >> iconName [
	
	^ content systemIconName
]
