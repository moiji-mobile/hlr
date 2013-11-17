as yet unclassified
doExecute
	"Avoid using XUDT as part of the spec..."
	(subscriber subscriberDataAsASN1: hlr) do: [:each |
		self insertSubscriberData: each].
