Object subclass: #Ant
	instanceVariableNames: 'my_position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Langton'!
!Ant commentStamp: 'ToF 10/25/2019 20:15' prior: 0!
I am an ant. I move and paint.
!


!Ant methodsFor: 'accessing' stamp: 'ToF 10/25/2019 20:35'!
position
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ my_position! !

!Ant methodsFor: 'accessing' stamp: 'ToF 10/25/2019 20:53'!
position: anInteger			
	 my_position := anInteger ! !


!Ant methodsFor: 'update cycle' stamp: 'ToF 10/25/2019 20:34'!
tick
	my_position := my_position + 1

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ant class
	instanceVariableNames: ''!

!Ant class methodsFor: 'class initialization' stamp: 'ToF 10/25/2019 20:44'!
initialize 
	super initialize.
	^ self
	! !


!Ant class methodsFor: 'initialize' stamp: 'ToF 10/25/2019 20:52'!
newWithPosition: anInteger 
	^ (self new position: anInteger)
	! !

Ant initialize!
