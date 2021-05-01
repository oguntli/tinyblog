Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'adminUser',
		'posts'
	],
	#category : #TinyBlog
}

{ #category : #testing }
TBBlog class >> createDemoPosts [
  "TBBlog create demo posts"
  self current 
    writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text:
           'TinyBlog is a small blog engine made with Pharo.' category:
           'TinyBlog') visible: true);
    writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text:
           'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
           nice event with more than 15 motivated sprinters. With the help
           of candies, cakes and chocolate, huge work has been done'
           category: 'Pharo') visible: true);
    writeBlogPost: ((TBPost title: 'Brick on top of Bloc -
           Preview' text: 'We are happy to announce the first preview
           version of Brick, a new widget set created from scratch on top
           of Bloc. Brick is being developed primarily by Alex Syrel
           (together with Alain Plantec, Andrei Chis and myself), and the
           work is sponsored by ESUG.
            Brick is part of the Glamorous Toolkit effort and will provide
           the basis for the new versions of the development tools.'
           category: 'Pharo') visible: true);
    writeBlogPost: ((TBPost title: 'The sad story of unclassified
           blog posts' text: 'So sad that I can read this.') visible: true);
    writeBlogPost: ((TBPost title: 'Working with Pharo on the
           Raspberry Pi' text: 'Hardware is getting cheaper and many new
           small devices like the famous Raspberry Pi provide new
           computation power that was one once only available on regular
           desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #initialization }
TBBlog class >> current [ 
  "answer the instance of TBRepository"
  ^ self selectAll 
      ifNotEmpty: [ :x | x anyOne ]
      ifEmpty: [ self new save ]
]

{ #category : #testing }
TBBlog class >> defaultAdminLogin [
  ^ 'admin'
]

{ #category : #testing }
TBBlog class >> defaultAdminPassword [
  ^ 'topsecret'
]

{ #category : #initialization }
TBBlog class >> initialize [ 
  self reset
]

{ #category : #initialization }
TBBlog class >> initializeVoyageOnMemoryDB [
  VOMemoryRepository new enableSingleton 

]

{ #category : #initialization }
TBBlog class >> isVoyageRoot [
  "Indicate that instances of this class are top level documents in noSQL database"
  ^ true
]

{ #category : #initialization }
TBBlog class >> reset [
  self initializeVoyageOnMemoryDB 
]

{ #category : #accessing }
TBBlog >> administrator [
  ^ adminUser
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPostsFromCategeroy: aCategory [
  ^ posts select: [ :p | p category = aCategory ]
]

{ #category : #accessing }
TBBlog >> allCategories [
  ^ (self allBlogPosts collect: [:p | p category]) asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [ 
  ^ posts select: [ :p | p isVisible  ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
  ^ posts select: [ :p | p category = aCategory 
	               and: [ p isVisible  ] ]
]

{ #category : #initialization }
TBBlog >> createAdministrator [
  ^ TBAdministrator
       login: self class defaultAdminLogin 
       password: self class defaultAdminPassword 
]

{ #category : #initialization }
TBBlog >> initialize [ 
  super initialize.
  posts := OrderedCollection new .
  adminUser := self createAdministrator 
]

{ #category : #initialization }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new.
	self save.
]

{ #category : #accessing }
TBBlog >> size [ 
  ^ posts size
]

{ #category : #'as yet unclassified' }
TBBlog >> writeBlogPost: aPost [ 
	"Write the blog post in database"
	self allBlogPosts add: aPost.
	self save
]
