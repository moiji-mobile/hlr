as yet unclassified
doExecute

	"Avoid using XUDT as part of the spec..."
	(dialogue subscriberDataAsASN1For: subscriber) do: [:each |
		self insertSubscriberData: each].
