Extension { #name : 'RPackage' }

{ #category : '*NewTools-CodeCritiques' }
RPackage >> criticNameOn: aStream [
	"This behavior may be folded later by changing the name of this method or using another one."

	aStream << self packageName
]