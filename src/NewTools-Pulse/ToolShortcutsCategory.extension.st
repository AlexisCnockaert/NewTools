Extension { #name : 'ToolShortcutsCategory' }

{ #category : '*NewTools-Pulse' }
ToolShortcutsCategory >> openPulseCommands [

	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openPulseCommandsShortcut action: [ :target | 
		| selection spot |
		selection := target selection.
		spot := (self tools toolNamed: #pulse).
		(spot insertsSelection and: [ selection isNotNil ])
			ifTrue: [ spot  openWithTextOnCommands: selection ]
			ifFalse: [ spot openWithTextOnCommands: '' ] ]
]

{ #category : '*NewTools-Pulse' }
ToolShortcutsCategory >> openPulseEnvironment [
"This code has a bridge to be able to change between using StPulse (new Spotter) or StSpotter (old Spotter), while it is being tested. Will eventually be removed."
	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openPulseEnvironmentShortcut action: [ :target | 
		| selection spot |
		selection := target selection.
		spot := (self tools toolNamed: #pulse).
		spot activated 
			ifTrue: [  
				(spot insertsSelection and: [ selection isNotNil ])
					ifTrue: [ spot  openWithTextOnEnvironment: selection ]
					ifFalse: [ spot openWithTextOnEnvironment: '' ] ]
			ifFalse: [ 
				spot := (self tools toolNamed: #spotter).
		  		(spot insertsSelection and: [ selection isNotNil ])
			  		ifTrue: [ spot  openWithText: selection ]
			  		ifFalse: [ spot open ] ] ]
]

{ #category : '*NewTools-Pulse' }
ToolShortcutsCategory >> openPulseWindows [

	<shortcut>
	^ KMKeymap shortcut: PharoShortcuts current openPulseWindowsShortcut action: [ :target | 
		| selection spot |
		selection := target selection.
		spot := (self tools toolNamed: #pulse).
		(spot insertsSelection and: [ selection isNotNil ])
			ifTrue: [ spot  openWithTextOnWindows: selection ]
			ifFalse: [ spot openWithTextOnWindows: '' ] ]
]
