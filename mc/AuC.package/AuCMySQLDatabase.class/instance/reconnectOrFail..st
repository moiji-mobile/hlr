as yet unclassified
reconnectOrFail: aBlock
	[
		self connect
	] on: ConnectionTimedOut do: [:err |
		err logException: 'Re-connect failed' area: #hlr.
		self discardOldConnection.
		^aBlock cull: 'Connection timed out'].