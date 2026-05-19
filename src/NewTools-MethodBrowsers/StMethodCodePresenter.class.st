"
I represent a code presenter used for the method browser, as I provide a refactoring command group
"
Class {
	#name : 'StMethodCodePresenter',
	#superclass : 'SpCodePresenter',
	#instVars : [
		'methodBrowser'
	],
	#category : 'NewTools-MethodBrowsers-Base',
	#package : 'NewTools-MethodBrowsers',
	#tag : 'Base'
}

{ #category : 'commands' }
StMethodCodePresenter class >> buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup [

	presenter methodBrowser ifNotNil: [
			aCmCommandsGroup register: presenter refactoringCommandsGroup.
			aCmCommandsGroup register: presenter debugCommandsGroup ].
	super buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup
]

{ #category : 'intialization' }
StMethodCodePresenter >> debugCommandsGroup [

	| group |
	group := (CmCommandGroup named: 'Debug Points') asSpecGroup
		         beDisplayedAsSubMenu;
		         iconName: #smallDebug;
		         yourself.
	{
		StAddBreakPointCommand.
		StAddWatchDebugPointCommand } do: [ :cmdClass | group register: (cmdClass forSpecContext: self methodBrowser) ].
	^ group
]

{ #category : 'accessing' }
StMethodCodePresenter >> methodBrowser [

	^ methodBrowser
]

{ #category : 'accessing' }
StMethodCodePresenter >> methodBrowser: aBrowser [

	methodBrowser := aBrowser
]

{ #category : 'intialization' }
StMethodCodePresenter >> refactoringCommandsGroup [

	| group |
	group := (CmCommandGroup named: 'Source Code') asSpecGroup
		         beDisplayedAsSubMenu;
		         iconName: #smallAuthoringTools;
		         yourself.
	StRefactoringCommandRegistry commands do: [ :cmdClass | group register: (cmdClass forSpecContext: self methodBrowser) ].
	^ group
]
