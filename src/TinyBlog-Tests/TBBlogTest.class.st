Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [ 
  blog := TBBlog current.
  blog removeAllPosts.
  
  first := TBPost title: 'A Title' text: 'A text' category: 'First Category'.
  blog writeBlogPost: first.

  post := (TBPost title: 'Another title' text: 'Another text' category: 'Second Category') beVisible
]

{ #category : #running }
TBBlogTest >> tearDown [ 
  TBBlog reset
]

{ #category : #running }
TBBlogTest >> testAddblogPost [

  blog writeBlogPost: post.

  self assert: blog size equals: 2
]

{ #category : #running }
TBBlogTest >> testAllBlogPosts [

  blog writeBlogPost: post.
  self assert: blog allBlogPosts size equals: 2

]

{ #category : #running }
TBBlogTest >> testAllBlogPostsFromCategory [
  self assert: (blog allBlogPostsFromCategeroy: 'First Category') size equals: 1
]

{ #category : #running }
TBBlogTest >> testAllCategories [
  blog writeBlogPost: post.
  self assert: blog allCategories  size equals: 2

]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
  blog writeBlogPost: post.
  self assert: (blog allVisibleBlogPostsFromCategory: 'First Category') size equals: 0.
  self assert: (blog allVisibleBlogPostsFromCategory: 'Second Category') size equals: 1.
]

{ #category : #running }
TBBlogTest >> testAllvisibleBlogPosts [

  blog writeBlogPost: post.
  self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #running }
TBBlogTest >> testRemoveAllBlogPosts [

  blog removeAllPosts.
  self assert: blog size equals: 0
]

{ #category : #running }
TBBlogTest >> testSize [

  self assert: blog size equals: 1
]
