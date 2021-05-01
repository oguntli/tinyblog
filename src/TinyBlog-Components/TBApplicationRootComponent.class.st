Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'class initialization' }
TBApplicationRootComponent class >> canBeRoot [
  ^ true
]

{ #category : #'class initialization' }
TBApplicationRootComponent class >> initialize [ 
  "self initialize"
  | app |
  app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
  app
    addLibrary: JQDeploymentLibrary;
    addLibrary: JQUiDeploymentLibrary;
    addLibrary: TBSDeploymentLibrary 
]

{ #category : #initialization }
TBApplicationRootComponent >> initialize [
  super initialize.
  main := TBPostListComponent  new
]

{ #category : #initialization }
TBApplicationRootComponent >> main: aComponent [
  main := aComponent
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
  html render: main
]

{ #category : #rendering }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
  super updateRoot: anHtmlRoot.
  anHtmlRoot beHtml5.
  anHtmlRoot title: 'TinyBlog'
]
