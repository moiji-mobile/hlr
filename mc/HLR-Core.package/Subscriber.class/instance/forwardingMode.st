forwarding
forwardingMode
	| ssData |
	ssData := self supplementaryServiceForCode: SSData callForwardingUnconditional ifAbsent: [nil].
	ssData ifNil: [^self class forwardMaybe].

	^ssData isActive
		ifTrue: [^self class forwardAlways]
		ifFalse: [^self class forwardMaybe].