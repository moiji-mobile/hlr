versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.1 : bisecting SS7 into TCAP and HLR'.
		spec author: 'NorbertHartl'.
		spec timestamp: '12/10/2013 11:58'.
		spec 
			project: 'Phexample' with: '1.2';
			project: 'Osmocom' with: '0.1.6';
			project: 'TCAP' with: '0.2';
			project: 'ASN1' with: '0.8.13'.
		spec 
			package: 'HLR-Core' with: 'HLR-Core-HolgerHansPeterFreyther.81';
			package: 'HLR-Camel' with: 'HLR-Camel-HolgerHansPeterFreyther.10';
			package: 'HLR-Voyage' with: 'HLR-Voyage-HolgerHansPeterFreyther.7'. ].
