as yet unclassified
supplementaryServiceForCode: aSSCode ifAbsent: aBlock
	self provisionedSS do: [:each |
		each ssCode = aSSCode
			ifTrue: [^each]].
	^aBlock value