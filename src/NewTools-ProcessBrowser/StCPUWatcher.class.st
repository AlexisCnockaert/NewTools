"
I am an Object that holds the CPU consumption of each process.
I start a process that runs regularly and see what are the processes that will run and do a pretty good estimation of CPU usage
"
Class {
	#name : 'StCPUWatcher',
	#superclass : 'Object',
	#instVars : [
		'watcherProcess',
		'processMap'
	],
	#category : 'NewTools-ProcessBrowser-Browsers',
	#package : 'NewTools-ProcessBrowser',
	#tag : 'Browsers'
}

{ #category : 'accessing' }
StCPUWatcher >> isRunning [

	^ watcherProcess isNotNil
]

{ #category : 'accessing' }
StCPUWatcher >> runningPercentageFor: aProcess [

	processMap ifNil: [ ^ '-- %' ].
	
	^ processMap at: aProcess 
		ifPresent: [ :aPercentage | ((aPercentage * 100) printShowingDecimalPlaces: 2) , ' %' ]
		ifAbsent: [ '0.00 %' ]

]

{ #category : 'controlling' }
StCPUWatcher >> start [

	watcherProcess ifNotNil: [ self stop ].
	watcherProcess := [
		                  [
		                  self updateProcessMap:
			                  (Processor tallyCPUUsageFor: 2) value ] repeat ]
		                  forkAt: Processor highestPriority
		                  named: 'CPU Watcher Process'
]

{ #category : 'controlling' }
StCPUWatcher >> stop [

	watcherProcess ifNil: [ ^ self ].
	watcherProcess terminate.
	watcherProcess := nil
]

{ #category : 'accessing' }
StCPUWatcher >> updateProcessMap: aIdentityBag [

	| total |

	total := aIdentityBag size.
	processMap := Dictionary new.
	total = 0 ifTrue: [ ^ self ].
	aIdentityBag keysAndValuesDo: [ :process :count | processMap at: process put: (count / total) asFloat ]
]
