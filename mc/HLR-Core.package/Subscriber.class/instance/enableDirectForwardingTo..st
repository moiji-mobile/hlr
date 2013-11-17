forwarding
enableDirectForwardingTo: aNumber
	| ssData |
	ssData := self activateSupplementaryServiceForCode: SSData callForwardingUnconditional.
	ssData forwardedToNumber: aNumber.