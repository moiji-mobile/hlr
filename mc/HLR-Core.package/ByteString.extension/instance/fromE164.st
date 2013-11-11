*HLR-Core
fromE164
	^GSMNumberDigits decodeFrom: (ByteArray readHexFrom: self) allButFirst.