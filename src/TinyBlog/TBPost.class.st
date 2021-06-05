Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText [
    ^ self new
        title: aTitle;
        text: aText;
        yourself 
  
]

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText category: aCategory [
    ^ (self title: aTitle text: aText)
              category: aCategory;
              yourself

]

{ #category : #'instance creation' }
TBPost class >> unclassifiedTag [
  ^ 'Unclassified'
]

{ #category : #action }
TBPost >> beVisible [
  self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: aDate [
	date := aDate
]

{ #category : #testing }
TBPost >> descriptionCategory [
         <magritteDescription>
         ^ MAStringDescription new
            label: 'Category';
            priority: 300;
            accessor: #category;
				comment: 'Unclassified if empty';
				componentClass: TBSMagritteTextInputComponent;
            yourself
]

{ #category : #testing }
TBPost >> descriptionContainer [
         <magritteContainer>
         ^ super descriptionContainer componentRenderer: TBSMagritteFormRenderer;
           yourself
]

{ #category : #testing }
TBPost >> descriptionDate [
         <magritteDescription>
         ^ MADateDescription new
            accessor: #date;
			   label: 'Date';
			   priority: 400;
            beRequired;
            yourself
]

{ #category : #testing }
TBPost >> descriptionText [
         <magritteDescription>
         ^ MAMemoDescription new
            accessor: #text;
			   label: 'Text';
			   priority: 200;
				comment: 'Please enter a text';
				requiredErrorMessage: 'A blog post must have a text.';
				componentClass: TBSMagritteTextAreaComponent;
            beRequired;
            yourself
]

{ #category : #testing }
TBPost >> descriptionTitle [
         <magritteDescription>
         ^ MAStringDescription new
            accessor: #title;
            label: 'Title';
            priority: 100;
				comment: 'Please enter a Title';
				requiredErrorMessage: 'A blog post must have a title.';
				componentClass: TBSMagritteTextInputComponent;
            beRequired;
            yourself
]

{ #category : #testing }
TBPost >> descriptionVisible [
         <magritteDescription>
         ^ MABooleanDescription new
            accessor: #visible;
            label: 'Visible';
				priority: 500;
				componentClass: TBSMagritteCheckboxComponent;
            beRequired;
            yourself
]

{ #category : #initialization }
TBPost >> initialize [
  super initialize.
  self category: self class unclassifiedTag.
  self date: Date today.
  self notVisible 
]

{ #category : #testing }
TBPost >> isUnclassified [
  ^ self category = self class unclassifiedTag

]

{ #category : #testing }
TBPost >> isVisible [ 
   ^ self visible 
]

{ #category : #action }
TBPost >> notVisible [
  self visible: false
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: aString [ 
	text := aString
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: aString [ 
	title := aString 
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: aBoolean [
	visible := aBoolean
]
