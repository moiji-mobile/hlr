acn-mapping
addSelectorToApplicationContextNameMapping: aSelector
	| operation method operationPragma operationName |

	"Find the method "
	method := self class >> aSelector.
	operationPragma := method pragmas select: [:each | each keyword = #'operation:' ].
	operationName := operationPragma isEmpty
			ifTrue: [(aSelector subStrings: ':') first]
			ifFalse: [operationPragma first arguments first].
	
	"Not a MAP method..."
	operation := TCAP current model bindingNamed: operationName.
	operation
		ifNil: [^self].

	"Find the ACNs for our operation and add things to the mapping"
	(TCAP current model applicationContextsForOperation: operation value)
		keysAndValuesDo: [:name :acn |
			| oid operationCode |
			oid := acn attributeAt: 'code'.
			operationCode := operation value attributeAt: 'operationCode'.
			acnMapping at: (oid -> operationCode) put: aSelector].
