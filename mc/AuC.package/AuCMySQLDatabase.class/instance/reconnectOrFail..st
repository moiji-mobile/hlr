as yet unclassified
reconnectOrFail: aBlock
	[
		self connect
	] on: ConnectionTimedOut do: [:err |
		err logException: 'Re-connect failed' area: #hlr.
		^aBlock cull: 'Connection timed out'].