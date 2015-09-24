as yet unclassified
doExecute
	| operation |
	operation := dialogue rosOperationNamed: 'insertSubscriberDataV3'.
	
	(dialogue subscriberDataGPRSAsASN1For: subscriber type: operation argumentType) do: [:each |
		self insertSubscriberData: each]