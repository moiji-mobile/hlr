execution
onSubscriberFound: subscriber
	| result |
	result := invocation resultValue.
	self formatTripletListFor: subscriber on: result.
	invocation returnResultLast: result.
	
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'.