as yet unclassified
connectOrFail: aBlock
	"Make sure the connection is still active"
	connection isConnected ifTrue: [
		[
			connection execute: 'SELECT 1'
		] on: Error do: [:err |
			err logException: 'Test query failed' area: #hlr.
		]].

	"Check if we need to connect and then connect"
	connection isConnected ifFalse: [
		[self connect  ] on: ConnectionTimedOut do: [:err |
			err logException: 'Re-connect failed' area: #hlr.
			^aBlock cull: 'Connection timed out']].