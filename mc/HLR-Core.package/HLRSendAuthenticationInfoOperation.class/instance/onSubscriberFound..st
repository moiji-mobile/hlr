execution
onSubscriberFound: subscriber
	| result |
	result := invocation newResultValue.
	self formatTripletListFor: subscriber on: result.
	invocation returnResultLast: result.
	
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'.