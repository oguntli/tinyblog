Class {
	#name : #TBAdminComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBAdminComponent >> children [
         ^ super children copyWith: self report
]

{ #category : #rendering }
TBAdminComponent >> createHeaderComponent [ 
  ^ TBAdminHeaderComponent from: self
]

{ #category : #rendering }
TBAdminComponent >> goToPostListView [
  self answer
]

{ #category : #rendering }
TBAdminComponent >> initialize [
         super initialize.
         self report: (TBPostsReport from: self blog)
]

{ #category : #rendering }
TBAdminComponent >> renderContentOn: html [
         super renderContentOn: html.
         html tbsContainer: [
            html heading: 'Blog Admin'.
            html horizontalRule.
            html render: self report ]
]

{ #category : #rendering }
TBAdminComponent >> report [
         ^ report
]

{ #category : #rendering }
TBAdminComponent >> report: aReport [
         report := aReport
]
