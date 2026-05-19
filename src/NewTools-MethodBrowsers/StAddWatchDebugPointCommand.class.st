"
I define a command to add a watchpoint on the AST node corresponding to the selected code
"
Class {
	#name : 'StAddWatchDebugPointCommand',
	#superclass : 'StCommand',
	#category : 'NewTools-MethodBrowsers-Commands',
	#package : 'NewTools-MethodBrowsers',
	#tag : 'Commands'
}

{ #category : 'accessing' }
StAddWatchDebugPointCommand class >> defaultIconName [

	^ #history
]

{ #category : 'default' }
StAddWatchDebugPointCommand class >> defaultName [

	^ 'Add Watch Debug Point'
]

{ #category : 'testing' }
StAddWatchDebugPointCommand >> canBeExecuted [

	| node |
	context hasUnacceptedEdits ifTrue: [ ^ false ].


	node := context codeEditor codePresenter selectedNode.

	^ node isNotNil and: [
			  node isCommentNode not and: [
					  node isPragma not and: [
						  node isSequence not and: [ node isLiteralNode not and: [ (node isVariable and: [ node isDefinition ]) not ] ] ] ] ]
]

{ #category : 'executing' }
StAddWatchDebugPointCommand >> execute [

	| dp |
	dp := DebugPointManager installNew: WatchDebugPoint on: context codeEditor codePresenter selectedNode.
	dp properties at: #Icon put: #history.
	DebugPointManager notifyDebugPointChanged: dp
]
