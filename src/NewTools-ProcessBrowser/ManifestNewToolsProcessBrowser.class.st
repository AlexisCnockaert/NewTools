"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestNewToolsProcessBrowser',
	#superclass : 'PackageManifest',
	#category : 'NewTools-ProcessBrowser-Manifest',
	#package : 'NewTools-ProcessBrowser',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestNewToolsProcessBrowser class >> ruleExcessiveVariablesRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#StProcessBrowser)) #'2025-06-05T17:40:42.927079+02:00') )
]
