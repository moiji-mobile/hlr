execution
execute
	database newQuery
		imsi: imsi;
		onSuccess: [:subscriber |
			| tripletList |
			tripletList := self generateAuthenticationListFor: subscriber count: self vectors.
			invocation returnResultLast: (self formatResponse: tripletList).
			dialogue endDialogue];
		onFailure: [:reason |
			self logError:
					('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
							expandMacrosWith: imsi with: reason) area: #hlr.
			invocation returnError: 'systemFailure'.
			dialogue endDialogue];
		start.