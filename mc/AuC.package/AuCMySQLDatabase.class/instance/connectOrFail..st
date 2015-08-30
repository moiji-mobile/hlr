as yet unclassified
connectOrFail: aBlock

	"Create the connection if it doesn't exist"
	connection ifNil: [
		logger logNotice: 'DB connection being initialized' with: {}.
		^self reconnectOrFail: aBlock].

	"Make sure the connection is still active"
	connection isConnected ifTrue: [
		[
			| res |
			res := connection execute: 'SELECT 1+2'.
			res first first = 3 ifFalse: [
				logger logError: 'Test query failed' with: { 'res' -> res first first }].
		] on: Error do: [:err |
			err logException: 'Test query failed' area: #hlr.
			^self reconnectOrFail: aBlock
		]].

	"Check if we need to connect and then connect"
	connection isConnected ifFalse: [
		^self reconnectOrFail: aBlock].