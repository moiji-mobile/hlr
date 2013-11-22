insert-subscriberdata
subscriberDataAsASN1
	"This needs to segment the subscriber data..."
	^OrderedCollection new
		add: self subscriberDataFirst;
		add: self subscriberDataSecond;
		yourself