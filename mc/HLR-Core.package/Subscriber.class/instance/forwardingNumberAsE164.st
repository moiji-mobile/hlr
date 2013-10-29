forwarding
forwardingNumberAsE164
	^forwardingNumber isNil
		ifTrue: [nil]
		ifFalse: [^(#(16r91) , (GSMNumberDigits encodeFrom: forwardingNumber)) asByteArray hex].