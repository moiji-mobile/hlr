forwarding
forwardedToNumberAsE164
	| ssData |
	"TODO: check for other call forwarding settings"
	ssData := self supplementaryServiceForCode: SSData callForwardingUnconditional ifAbsent: [^nil].
	^ssData forwardedToNumber toE164