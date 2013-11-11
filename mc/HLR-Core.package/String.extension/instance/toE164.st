*HLR-Core
toE164
	^(#(16r91) , (GSMNumberDigits encodeFrom: self)) asByteArray hex