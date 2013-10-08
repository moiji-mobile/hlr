testing
createTestDefault
	| repository |
	repository := VOMongoRepository 
				host: 'localhost' database: 'hlrTest'.
	^self initializeWith: repository.