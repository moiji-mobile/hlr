*HLR-Core
fromTBCD
	^GSMNumberDigits decodeFrom: (ByteArray readHexFrom: self).