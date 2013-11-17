insert-subscriberdata
subscriberDataAsASN1: aHlr
	"This needs to segment the subscriber data..."
	^OrderedCollection new
		add: self subscriberDataFirst;
		add: self subscriberDataSecond;
		yourself