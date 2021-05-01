Class {
	#name : #TBAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBAuthentificationComponent class >> from: aComponent [
  ^ self new
      component: aComponent;
      yourself
]

{ #category : #accessing }
TBAuthentificationComponent >> account [
  ^ account
]

{ #category : #accessing }
TBAuthentificationComponent >> account: anObject [
  account := anObject
]

{ #category : #accessing }
TBAuthentificationComponent >> component [ 
  ^ component
]

{ #category : #accessing }
TBAuthentificationComponent >> component: anObject [
  component := anObject
]

{ #category : #accessing }
TBAuthentificationComponent >> password [ 
  ^ password
]

{ #category : #accessing }
TBAuthentificationComponent >> password: anObject [
  password := anObject 
]

{ #category : #accessing }
TBAuthentificationComponent >> renderAccountFieldOn: html [  
  html 
    tbsFormGroup: [ html label with: 'Account'.
	    html textInput 
	       tbsFormControl;
	       attributeAt: 'autofocus' put: 'true';
	       callback: [ :value | account := value ];
	       value: account ] 
]

{ #category : #accessing }
TBAuthentificationComponent >> renderBodyOn: html [
  html   
    tbsModalBody: [ 
	    html tbsForm: [ 
		   self renderAccountFieldOn: html.
		   self renderPasswordFieldOn: html.
		   html tbsModalFooter: [ self renderButtonsOn: html ] ] ]
]

{ #category : #accessing }
TBAuthentificationComponent >> renderButtonsOn: html [
  html tbsButton 
    attributeAt: 'type' put: 'button';
    attributeAt: 'data-dismiss' put: 'modal';
    beDefault ;
    value: 'Cancel'.
  html tbsSubmitButton 
    bePrimary ;
    callback: [ self validate ];
    value: 'Sign In'
]

{ #category : #accessing }
TBAuthentificationComponent >> renderContentOn: html [
  html tbsModal 
    id: 'myAuthDialog';
    with: [  
	   html tbsModalDialog: [ 
		  html tbsModalContent: [ 
			 self renderHeaderOn: html.
			  self renderBodyOn: html ] ] ]
]

{ #category : #accessing }
TBAuthentificationComponent >> renderHeaderOn: html [
  html
    tbsModalHeader: [ 
	    html tbsModalCloseIcon.
	    html tbsModalTitle 
	      level: 4;
	      with: 'Authentication' ]
]

{ #category : #accessing }
TBAuthentificationComponent >> renderPasswordFieldOn: html [
  html tbsFormGroup: [ 
	  html label with: 'Password'.
	  html passwordInput 
	    tbsFormControl ;
	    callback: [ :value | password := value ];
	    value: password ]
]

{ #category : #accessing }
TBAuthentificationComponent >> validate [ 
  ^ component tryConnectionWithLogin: self account andPassword: self password
]
