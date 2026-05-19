"
I define a command to add a breakpoint on the AST node corresponding to the selected code
"
Class {
	#name : 'StAddBreakPointCommand',
	#superclass : 'StCommand',
	#category : 'NewTools-MethodBrowsers-Commands',
	#package : 'NewTools-MethodBrowsers',
	#tag : 'Commands'
}

{ #category : 'accessing' }
StAddBreakPointCommand class >> defaultIconName [

	^ #smallError
]

{ #category : 'default' }
StAddBreakPointCommand class >> defaultName [

	^ 'Add Breakpoint' 
]

{ #category : 'testing' }
StAddBreakPointCommand >> canBeExecuted [

	| node |
	context hasUnacceptedEdits ifTrue: [ ^ false ].


	node := context codeEditor codePresenter selectedNode.

	^ node isNotNil and: [
			  node isCommentNode not and: [
					  node isPragma not and: [
						  node isSequence not and: [ node isLiteralNode not and: [ (node isVariable and: [ node isDefinition ]) not ] ] ] ] ]
]

{ #category : 'executing' }
StAddBreakPointCommand >> execute [

	| dp |
	dp := DebugPointManager installNew: BreakDebugPoint on: context codeEditor codePresenter selectedNode.

	dp properties at: #Icon put: #smallError.
	DebugPointManager notifyDebugPointChanged: dp
]
