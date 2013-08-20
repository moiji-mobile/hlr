acn-mapping
buildApplicationContextNameMapping
	"I will try to map the selectors to Operations to ACN..."
	acnMapping := Dictionary new.
	
	self class selectors do: [:each |
		self addSelectorToApplicationContextNameMapping: each].