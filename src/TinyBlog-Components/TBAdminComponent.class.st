Class {
	#name : #TBAdminComponent,
	#superclass : #TBScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBAdminComponent >> createHeaderComponent [ 
  ^ TBAdminHeaderComponent from: self
]

{ #category : #rendering }
TBAdminComponent >> goToPostListView [
  self answer
]

{ #category : #rendering }
TBAdminComponent >> renderContentOn: html [ 
  super renderContentOn: html.
  html tbsContainer: [ 
	  html heading: 'Blog Admin'.
	  html horizontalRule  ]
]
