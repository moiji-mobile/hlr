infoRetrievalPackage
sendAuthenticationInfoV2: aDialogue request: anInvoke
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := GSMNumberDigits decodeFrom: anInvoke components first imsi.
	database newQuery
		imsi: imsi;
		onSuccess: [:subscriber |
			| tripletList |
			tripletList := self generateAuthenticationListFor: subscriber count: 4.
			aDialogue returnLast: tripletList.
		];
		onFailure: [:reason |
			self logError:
					('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
							expandMacrosWith: imsi with: reason) area: #hlr.
			aDialogue returnError: 'systemFailure'.];
		start.