forwarding
forwardedToNumberAsE164
	| ssData |
	"TODO: check for other call forwarding settings"
	ssData := self provisionedSS at: SSData callForwardingUnconditional ifAbsent: [^nil].
	^ssData forwardedToNumber toE164