execution
execute

	database newQuery
		imsi: imsi;
		onSuccess: [:subscriber |
			| tripletList |
			tripletList := self generateAuthenticationListFor: subscriber count: vectors.
			invocation
				returnLast: (formatResponse value: tripletList);
				endDialogue];
		onFailure: [:reason |
			self logError:
					('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
							expandMacrosWith: imsi with: reason) area: #hlr.
			invocation
				returnError: 'systemFailure';
				endDialogue];
		start.