# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	
	width = $(window).width()
	if width < 990 or 1024 <= width < 1280 or 1360 <= width < 1600
		th = $ 'th'
		h2 = $ 'h2'
		h2.css
			'font-size': "10px"
		h2.text("#{width}")

		arr = []
		arr.push 'a', 'b'
		h2.text("#{arr[1]")

		for el in th
			wid = 10
			wid += child.offsetWidth for child in el.children
			el.style.minWidth = "#{wid}px"
