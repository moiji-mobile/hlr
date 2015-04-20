forwarding
forwardedToNumber
	| ssData |
	"TODO: check for other call forwarding settings"
	ssData := self supplementaryServiceForCode: SSData callForwardingUnconditional ifAbsent: [^nil].
	^ssData forwardedToNumber