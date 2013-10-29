execution
onSubscriberFound: subscriber
	| tripletList |
	
	tripletList := self generateAuthenticationListFor: subscriber count: self vectors.
	invocation returnResultLast: (self formatResponse: tripletList).
	dialogue requestTcEnd: false.