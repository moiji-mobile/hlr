accessing
hlrNumberAsE164
	^(#(16r91) , (GSMNumberDigits encodeFrom: hlrNumber)) asByteArray hex