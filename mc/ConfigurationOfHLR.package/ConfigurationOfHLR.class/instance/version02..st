versions
version02: spec
	<version: '0.2' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.1 : added CDR as dependency'.
		spec author: 'NorbertHartl'.
		spec timestamp: '12/10/2013 14:20'.
		spec 
			project: 'Phexample' with: '1.2';
			project: 'Osmocom' with: '0.1.6';
			project: 'CDR' with: '0.2';
			project: 'TCAP' with: '0.2'.
		spec 
			package: 'HLR-Core' with: 'HLR-Core-HolgerHansPeterFreyther.81';
			package: 'HLR-Camel' with: 'HLR-Camel-HolgerHansPeterFreyther.10';
			package: 'HLR-Voyage' with: 'HLR-Voyage-HolgerHansPeterFreyther.7'. ].
