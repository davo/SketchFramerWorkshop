# Set Screen background
Screen.backgroundColor = "#F2F2F2"

# Set default animation options
Framer.Defaults.Animation =
	time: 0.95
	curve: Spring(damping: 0.65) 

$ = Framer.Importer.load("imported/01@2x", scale: 1)

# States

# Set up FlowComponent
flow = new FlowComponent
	backgroundColor: "#F2F2F2"

flow.footer = $.menu

# Show the layer 
flow.showNext($.feedView)

# Allow scrolling with mouse
flow.scroll.mouseWheelEnabled = true

$.card.onTap ->
	flow.showOverlayCenter($.fullImageView)

$.back_btn.onTap ->
	flow.showPrevious()

$.home.onTap ->
	flow.showPrevious($.feedView)

$.profile.onTap ->
	flow.showNext($.profileView)

$.bkg.backgroundBlur = 20

# Fix: Calculate position of new elements
# print ($.cardTemplate.y+$.cardTemplate.height+10) * 2


for index in [0..2]

	newCard = $.cardTemplate.copy()
	newCard.name = 'card0'+index
	newCard.parent = $.feedView
	
	newCard.y = $.cardTemplate.y+$.cardTemplate.height+10
	
	
	$.feedView.height = $.feedView.contentFrame().height + 10
	flow.scroll.updateContent()
	
		
	photo = newCard.children[3]
	
	photo.image = Utils.randomImage()
	photo.borderRadius =
		topLeft: 3
		topRight: 3

for layer, i in $.feedView.children.reverse()
	layer.opacity = 0
	layer.x = 50
	layer.states =
		fadeIn:
			opacity: 1
			x: 10
			options: 
				delay: 0.25 * i

Utils.delay 1.5, ->
	for layer in $.feedView.children
		layer.animate('fadeIn')