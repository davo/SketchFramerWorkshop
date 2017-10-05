# Set Screen background
Screen.backgroundColor = "#F2F2F2"

# Set default animation options
Framer.Defaults.Animation =
	time: 0.75
	curve: Spring(damping: 0.85) 

$ = Framer.Importer.load("imported/01@2x", scale: 1)

# States

# Set up FlowComponent
flow = new FlowComponent
	backgroundColor: "#F2F2F2"


# Turn nav as footer
flow.footer = $.menu

for layer, i in $.feedView.children.reverse()
	layer.opacity = 0
	layer.x = 150
	layer.blur = 20
	layer.states =
		fadeIn:
			blur: 0
			opacity: 1
			x: 10
			options: 
				delay: 0.35 * i

# Show the layer 
flow.showNext($.feedView)

Utils.delay 0.5, ->
	for layer in $.feedView.children
		layer.animate('fadeIn')

# Allow scrolling with mouse
flow.scroll.mouseWheelEnabled = true

$.card.onTap ->
	flow.showOverlayBottom($.fullImageView)

$.back_btn1.onTap ->
	flow.showPrevious()

$.back_btn.onTap ->
	flow.showPrevious($.feedView)

$.profile.onTap ->
	flow.showNext($.profileView)

