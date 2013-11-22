as yet unclassified
doExecute
	(dialogue subscriberDataGPRSAsASN1For: subscriber) do: [:each |
		self insertSubscriberData: each]