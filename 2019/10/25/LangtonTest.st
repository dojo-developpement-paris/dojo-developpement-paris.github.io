'From Pharo8.0.0 of 4 April 2019 [Build information: Pharo-8.0.0+build.215.sha.d1fa8865b40912552334c27f7874b5dbfb92ca9f (64 Bit)] on 27 October 2019 at 8:41:32.089179 am'!
TestCase subclass: #LangtonTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Langton-Tests-Langton-Tests'!

!LangtonTest methodsFor: 'dummy' stamp: 'ToF 10/25/2019 19:55'!
testDummy
	"a simple test to show how it works"
			
	self assert: true equals: true! !

!LangtonTest methodsFor: 'dummy' stamp: 'ToF 10/25/2019 20:32'!
testAntProperties
	"test the properties of an ant"
	| ant old_position |
	ant := Ant new.
	old_position := ant position.
	ant tick. 
	self assert: ant position ~= old_position 		
! !

