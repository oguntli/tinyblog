Class {
	#name : #TBCatagoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBCatagoriesComponent class >> categories: categories postsList: aTBScreen [
  ^ self new categories: categories ; postsList: aTBScreen 
]

{ #category : #accessing }
TBCatagoriesComponent >> categories [
  ^ categories
]

{ #category : #accessing }
TBCatagoriesComponent >> categories: aCollection [
  categories := aCollection asSortedCollection 
]

{ #category : #accessing }
TBCatagoriesComponent >> postsList [
  ^ postsList 
]

{ #category : #accessing }
TBCatagoriesComponent >> postsList: aComponent [
  postsList := aComponent 
]

{ #category : #accessing }
TBCatagoriesComponent >> renderCategoryLinkOn: html with: aCategory [
  html tbsLinkifyListGroupItem 
    callback: [ self selectCategory: aCategory ];
    with: aCategory
]

{ #category : #accessing }
TBCatagoriesComponent >> renderContentOn: html [
  html tbsListGroup: [ 
	html tbsListGroupItem 
	  with: [ html strong: 'Categories' ].
	categories  do: [ :cat |
		self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #accessing }
TBCatagoriesComponent >> selectCategory: aCategory [
  postsList currentCategory: aCategory
]
