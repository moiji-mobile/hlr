versions
version3: spec
	<version: '3' imports: #('3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '3 : RFB updates'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/12/2014 15:19'.
		spec 
			project: 'Phexample' with: '1.2';
			project: 'Osmocom' with: '0.1.6';
			project: 'CDR' with: '0.22';
			project: 'TCAP' with: '0.2.1';
			project: 'ASN1' with: '0.8.26';
			project: 'VoyageMongo' with: #'stable';
			project: 'RFB' with: '0.61'.
		spec 
			package: 'HLR-Core' with: 'HLR-Core-HolgerHansPeterFreyther.100';
			package: 'HLR-Camel' with: 'HLR-Camel-HolgerHansPeterFreyther.17';
			package: 'HLR-Voyage' with: 'HLR-Voyage-HolgerHansPeterFreyther.9'. ].
