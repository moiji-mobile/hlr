supplementary-service
supplementaryServiceFor: aSSCode
	"Not very object orientated.."
	aSSCode = SSData barrAllOutgoingCalls
		ifTrue: [^BarringSSData new].
	aSSCode = SSData callForwardingUnconditional
		ifTrue: [^ForwardingSSData new].
	^SSData new