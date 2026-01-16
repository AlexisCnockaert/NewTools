Extension { #name : 'PharoShortcuts' }

{ #category : '*NewTools-Pulse' }
PharoShortcuts >> openPulseCommandsShortcut [

	^ Character cr meta shift asShortcut
]

{ #category : '*NewTools-Pulse' }
PharoShortcuts >> openPulseEnvironmentShortcut [

	^ Character cr shift
]

{ #category : '*NewTools-Pulse' }
PharoShortcuts >> openPulseWindowsShortcut [

	^ Character cr shift alt asShortcut
]
