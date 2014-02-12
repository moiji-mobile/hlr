versions
version021: spec
	<version: '0.2.1' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.2.1 : rearranged dependencies and packages towards an deployable HLR
0.2.1 : updated all packages to newest version'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/12/2014 15:18'.
		spec 
			project: 'Phexample' with: '1.2';
			project: 'Osmocom' with: '0.1.6';
			project: 'CDR' with: '0.22';
			project: 'TCAP' with: '0.2.1';
			project: 'ASN1' with: '0.8.26';
			project: 'VoyageMongo' with: #'stable';
			project: 'RFB' with: '0.6'.
		spec 
			package: 'HLR-Core' with: 'HLR-Core-HolgerHansPeterFreyther.100';
			package: 'HLR-Camel' with: 'HLR-Camel-HolgerHansPeterFreyther.17';
			package: 'HLR-Voyage' with: 'HLR-Voyage-HolgerHansPeterFreyther.9'. ].
