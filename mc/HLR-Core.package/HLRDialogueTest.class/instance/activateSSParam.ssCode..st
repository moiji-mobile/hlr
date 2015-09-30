as yet unclassified
activateSSParam: anOperation ssCode: aNumber
	| param |
	param := anOperation newArgumentValue
		ss_Code: aNumber.
	(param expandFieldNamed: 'basicService')
		teleservice:  #[16r10].
	^ param