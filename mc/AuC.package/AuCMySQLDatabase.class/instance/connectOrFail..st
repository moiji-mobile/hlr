as yet unclassified
connectOrFail: aBlock
	"Make sure the connection is still active"
	connection isConnected ifTrue: [
		[
			connection execute: 'SELECT 1'
		] on: Error do: [:err |
			err logException: 'Test query failed' area: #hlr.
			^self reconnectOrFail: aBlock
		]].

	"Check if we need to connect and then connect"
	connection isConnected ifFalse: [
		^self reconnectOrFail: aBlock].