as yet unclassified
dispatchInvocation: anInvocation
	| selector operationName |
	operationName := anInvocation operationName.
	selector := anInvocation normalizedOperationName.

	"Check if there is a filter for the operation"
	(hlr operationIsAllowed: operationName) ifFalse: [
		logger logError: 'Operation not handled by AuC' with: { 'operationName' -> operationName }.
		^self requestTcUAbort: self newUAbort serviceUser.
	].

	"Abort the entire dialogue in case we don't know the invocation."
	(self respondsTo: selector)
		ifFalse: [^self requestTcUAbort: self newUAbort serviceUser].

	"Depending on routing it is best to use the real address"
	hlr updateAddress ifTrue: [
		self transaction address: hlr hlrSCCPAddress].	

	self perform: selector with: anInvocation.