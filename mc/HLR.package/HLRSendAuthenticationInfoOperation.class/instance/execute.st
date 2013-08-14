execution
execute

	database newQuery
		imsi: imsi;
		onSuccess: [:subscriber |
			| tripletList |
			tripletList := self generateAuthenticationListFor: subscriber count: 4.
			dialogue returnLast: (formatResponse value: tripletList).
		];
		onFailure: [:reason |
			self logError:
					('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
							expandMacrosWith: imsi with: reason) area: #hlr.
			dialogue returnError: 'systemFailure'.];
		start.