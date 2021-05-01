Class {
	#name : #TBAdminHeaderComponent,
	#superclass : #TBHeaderComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBAdminHeaderComponent >> renderButtonsOn: html [
  html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
TBAdminHeaderComponent >> renderDisconnectButtonOn: html [
  html tbsNavbarButton
    tbsPullRight;
    callback: [ component session reset ];
    with: [ 
	  html text: 'Disconnect '.
	  html tbsGlyphIcon iconLogout  ]
]
