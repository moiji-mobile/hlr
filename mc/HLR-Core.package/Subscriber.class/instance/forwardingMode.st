forwarding
forwardingMode
	^forwardingMode ifNil: [self class forwardMaybe]