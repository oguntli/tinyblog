Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBScreenComponent >> blog [
  "Return the current blog. In the future we will ask
  the session to return the blog of the currently logged in user."
  ^ TBBlog current
]

{ #category : #initialization }
TBScreenComponent >> children [
  ^ { header }
]

{ #category : #rendering }
TBScreenComponent >> createHeaderComponent [
  ^ TBHeaderComponent new
]

{ #category : #initialization }
TBScreenComponent >> initialize [
  super initialize.
  header := self createHeaderComponent
]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [
  html render: header
]
