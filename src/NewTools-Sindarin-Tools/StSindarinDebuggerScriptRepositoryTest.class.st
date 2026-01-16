Class {
	#name : 'StSindarinDebuggerScriptRepositoryTest',
	#superclass : 'TestCase',
	#category : 'NewTools-Sindarin-Tools-Tests',
	#package : 'NewTools-Sindarin-Tools',
	#tag : 'Tests'
}

{ #category : 'running' }
StSindarinDebuggerScriptRepositoryTest >> setUp [
	super setUp.
	
	StSindarinDebuggerScriptRepository clearScripts.
]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testAddMultipleScriptsStoresEachCorrectly [
	"We assume that the setup clears the scripts dictionary"

	|name1 name2 code1 code2|
	name1 := '01'.
	code1 := '"code01"'.
	name2 := '02'.
	code2 := '"code02'.
	
	StSindarinDebuggerScriptRepository saveScript: name1 code: code1.
	StSindarinDebuggerScriptRepository saveScript: name2 code: code2.
	
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: name1 ).
	self assert: (StSindarinDebuggerScriptRepository loadScript: name1 ) identicalTo: code1 .
	
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: name2 ).
	self assert: (StSindarinDebuggerScriptRepository loadScript: name2 ) identicalTo: code2 .

]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testAddScriptStoresCodeCorrectly [
	"We assume that the setup clears the scripts dictionary"
	
	|scriptName script|
	
	scriptName := 'Script01'.
	script := '"code de script"'.
	
	StSindarinDebuggerScriptRepository saveScript: scriptName code: script .
	
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName).
	self assert: (StSindarinDebuggerScriptRepository loadScript: scriptName ) identicalTo: script .
]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testClearScriptsEmptiesDictionary [
	"We assume that the setup clears the scripts dictionary"
	
	|scriptName1 scriptName2 script|
	
	scriptName1 := '01'.
	scriptName2 := '02'.
	script := '"code"'.
	
	StSindarinDebuggerScriptRepository saveScript: scriptName1 code: script.
	StSindarinDebuggerScriptRepository saveScript: scriptName2 code: script.
	
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName1).
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName2).
	
	StSindarinDebuggerScriptRepository clearScripts.
	
	self deny: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName1).
	self deny: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName2).
]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testLookupNonexistentScriptReturnsNil [
	"We assume that the setup clears the scripts dictionary"
	
	|notExistingScriptName|
	
	notExistingScriptName := 'Script404'.
	
	self deny: (StSindarinDebuggerScriptRepository scriptsNames includes: notExistingScriptName).
	self assert: ((StSindarinDebuggerScriptRepository loadScript: notExistingScriptName) isNil).
]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testOverwriteScriptReplacesCode [
	"We assume that the setup clears the scripts dictionary"
	
	|scriptName oldScript newScript|
	scriptName := 'script01'.
	oldScript := '"ancien code de script"'.
	newScript := '"nouveau code de script"'.
	
	StSindarinDebuggerScriptRepository saveScript: scriptName code: oldScript .
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName).
	self assert: (StSindarinDebuggerScriptRepository loadScript: scriptName ) identicalTo: oldScript .
	
	StSindarinDebuggerScriptRepository saveScript: scriptName code: newScript .
	self assert: (StSindarinDebuggerScriptRepository scriptsNames includes: scriptName).
	self assert: (StSindarinDebuggerScriptRepository loadScript: scriptName ) identicalTo: newScript .

]

{ #category : 'tests' }
StSindarinDebuggerScriptRepositoryTest >> testScriptsDictionaryIsInitialized [
	"We assume that the setup clears the scripts dictionary"
	
	self deny: (StSindarinDebuggerScriptRepository scripts isNil).
]
