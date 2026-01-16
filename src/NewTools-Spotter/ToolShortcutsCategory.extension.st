Extension { #name : 'ToolShortcutsCategory' }

{ #category : '*NewTools-Spotter' }
ToolShortcutsCategory >> openSpotter [
"
	<shortcut>
	^ KMKeymap shortcut: Character cr shift action: [ :target | 
		  | selection spot |
		  selection := target selection.
			spot := (self tools toolNamed: #spotter).
		  ( spot insertsSelection and: [ selection isNotNil ])
			  ifTrue: [ spot  openWithText: selection ]
			  ifFalse: [ spot open ] ] "
]
