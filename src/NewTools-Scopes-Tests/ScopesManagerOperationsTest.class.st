Class {
	#name : 'ScopesManagerOperationsTest',
	#superclass : 'TestCase',
	#category : 'NewTools-Scopes-Tests',
	#package : 'NewTools-Scopes-Tests'
}

{ #category : 'tests' }
ScopesManagerOperationsTest >> testAddClassToOrEnvironment [

	| packageEnvB classEnv orEnv |
	
	"empty class environment"
	
	classEnv := RBBrowserEnvironment new forClasses: { }.
	packageEnvB := RBBrowserEnvironment new forPackages: { ScClassB1 package }.
	
	orEnv := RBOrEnvironment onEnvironment: classEnv or: packageEnvB.
	
	orEnv addClass: ScClassA1.
	orEnv addClass: ScClassA1 class.
	
	self assert: orEnv definedClasses asSet equals: { ScClassA1 . ScClassB1 . ScClassB1Sub . ScClassB1SubSub } asSet.
	self assert: orEnv packages asSet equals: { ScClassA1 package . ScClassB1 package } asSet
]

{ #category : 'tests' }
ScopesManagerOperationsTest >> testAddClassToOrEnvironmentMakingAPackageFull [

	| packageEnv classEnvA1 orEnv |
	
	"class environment missing one class to complete the full package"
	classEnvA1 := RBBrowserEnvironment new forClasses: { ScClassA1 }.
	
	"empty package environment"
	packageEnv := RBBrowserEnvironment new forPackages: { }.
	
	orEnv := RBOrEnvironment onEnvironment: classEnvA1 or: packageEnv.
	
	orEnv addClass: ScClassA2.
	orEnv addClass: ScClassA2 class.
	
	self assert: orEnv allClasses asSet equals: { ScClassA1 . ScClassA2 } asSet.
	self assert: orEnv packages asSet equals: { ScClassA1 package } asSet
]

{ #category : 'tests' }
ScopesManagerOperationsTest >> testRemoveClassFromOrEnvironment [

	| classEnvA1 packageEnvB orEnv |
	
	classEnvA1 := RBBrowserEnvironment new forClasses: { ScClassA1 }.
	packageEnvB := RBBrowserEnvironment new forPackages: { ScClassB1 package }.
	
	orEnv := RBOrEnvironment onEnvironment: classEnvA1 or: packageEnvB.
	orEnv removeClass: ScClassA1.
	orEnv removeClass: ScClassA1 class.
	
	self assert: orEnv allClasses asSet equals: ScClassB1 package definedClasses 
]

{ #category : 'tests' }
ScopesManagerOperationsTest >> testRemoveClassFromOrEnvironmentBreakingFullPackage [

	| packageEnvA classEnv orEnv |
	
	"empty class environment"
	classEnv := RBBrowserEnvironment new forClasses: { }.
	
	"environment packageEnvA has two classes: ScClassA1 and ScClassA2"
	packageEnvA := RBBrowserEnvironment new forPackages: { ScClassA1 package }.
	
	orEnv := RBOrEnvironment onEnvironment: classEnv or: packageEnvA.
	orEnv removeClass: ScClassA1.
	orEnv removeClass: ScClassA1 class.
	
	self assert: orEnv definedClasses equals: { ScClassA2 . ScClassA3 } asSet
]