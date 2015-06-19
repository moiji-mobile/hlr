as yet unclassified
readResetSuccessCounter
	| res |
	res := successCounter.
	successCounter := 0.
	^res
	