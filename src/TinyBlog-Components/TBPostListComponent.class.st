Class {
	#name : #TBPostListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postComponents',
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

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
TBPostListComponent >> initialize [
  super initialize.
  postComponents := OrderedCollection new
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

{ #category : #rendering }
TBPostListComponent >> renderContentOn: html [ 
  super renderContentOn: html.
  html render: (TBCatagoriesComponent categories:  (self blog allCategories)  postsList: self).
  html tbsContainer: [ 
	self postComponents  do: [ :p |
		html render: p ] ]
]
