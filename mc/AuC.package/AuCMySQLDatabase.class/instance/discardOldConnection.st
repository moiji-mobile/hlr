as yet unclassified
discardOldConnection
	connection ifNotNil: [:conn |
		[
			logger logNotice: 'Discarding old connection' with: {  }.
			conn netSession ifNotNil: [:net |
				net theStream ifNotNil: [:stream |
					stream close]].
		] on: Error do: [:err |
			err logException: 'Failed to close the connection' area: #hlr.
		]
	]