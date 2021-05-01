Class {
	#name : #TBPostListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents',
		'currentCategory',
		'showLoginError'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostListComponent >> basicRenderCategoriesOn: html [
  html render: self categoriesComponent 
]

{ #category : #rendering }
TBPostListComponent >> basicRenderPostsOn: html [
  self readSelectedPosts do: [ :p | 
	 html render: (self postComponentFor: p) ]
]

{ #category : #rendering }
TBPostListComponent >> categoriesComponent [
  ^ TBCatagoriesComponent 
      categories: self blog allCategories 
      postsList: self
]

{ #category : #rendering }
TBPostListComponent >> children [ 
  ^ self postComponents , super children 
]

{ #category : #rendering }
TBPostListComponent >> currentCategory [
  ^ currentCategory 
]

{ #category : #rendering }
TBPostListComponent >> currentCategory: anObject [ 
  currentCategory := anObject 
]

{ #category : #rendering }
TBPostListComponent >> goToAdministrationView [ 
  self call: TBAdminComponent new
]

{ #category : #rendering }
TBPostListComponent >> hasLoginError [
  ^ showLoginError ifNil: [ false ]
]

{ #category : #rendering }
TBPostListComponent >> initialize [
  super initialize.
  postComponents := OrderedCollection new
]

{ #category : #rendering }
TBPostListComponent >> loginErrorMessage [
  ^ 'Incorrect login and / or password'
]

{ #category : #rendering }
TBPostListComponent >> loginErrorOccured [
  showLoginError := true
]

{ #category : #rendering }
TBPostListComponent >> postComponentFor: aPost [
  ^TBPostComponent new post: aPost
]

{ #category : #rendering }
TBPostListComponent >> postComponents [
  postComponents := self readSelectedPosts
    collect: [ :each | TBPostComponent new post: each ].
  ^ postComponents 
]

{ #category : #rendering }
TBPostListComponent >> readSelectedPosts [
  ^ self currentCategory 
      ifNil: [ self blog allVisibleBlogPosts ]
      ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory  ]
]

{ #category : #'tests-as yet unclassified' }
TBPostListComponent >> renderCategoryColumnOn: html [ 
  html tbsColumn 
    extraSmallSize: 12;
    smallSize: 2;
    mediumSize: 4;
    with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #rendering }
TBPostListComponent >> renderContentOn: html [ 
  super renderContentOn: html.
  html 
    tbsContainer: [ 
	   html tbsRow
	     showGrid;
		  with: [ self renderCategoryColumnOn: html.
			     self renderPostsColumnOn: html ] ]
]

{ #category : #'as yet unclassified' }
TBPostListComponent >> renderLoginErrorMessageIfAnyOn: html [ 
  self hasLoginError ifTrue: [ 
	  showLoginError := false.
	  html tbsAlert  
	    beDanger;
	    with: self loginErrorMessage  ]
]

{ #category : #'as yet unclassified' }
TBPostListComponent >> renderPostsColumnOn: html [ 
  html tbsColumn 
    extraSmallSize: 12;
    smallSize: 10;
    mediumSize: 8; 
    with: [ 
	  self renderLoginErrorMessageIfAnyOn: html.
	  self basicRenderPostsOn: html ]
]

{ #category : #rendering }
TBPostListComponent >> tryConnectionWithLogin: login andPassword: password [ 
  (login = self blog administrator login and: [ (SHA256 hashMessage: password) = self blog administrator password ])
    ifTrue: [ self session currentAdmin: self blog administrator.
	           self goToAdministrationView ]
    ifFalse: [ self loginErrorOccured  ]
]
