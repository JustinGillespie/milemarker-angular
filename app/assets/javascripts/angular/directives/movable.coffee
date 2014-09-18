App.directive "myDraggable", [ "$document", ($document) ->
  return (scope, element, attr) ->

    startX = 0
    startY = 0

    x = 0
    y = 0

    action    = null
    height    = null
    width     = null

    container = null

    element.parent().find('img').bind 'load', () -> container = $(this).width()

    element.on "mousedown", (event) ->
    
      event.preventDefault()
      
      startX = event.pageX - x
      startY = event.pageY - y

      action = event.target.className
      height = element.height()
      width  = element.width()

      $document.on "mousemove", mousemove
      $document.on "mouseup", mouseup

      return

    mousemove = (event) ->

      if action == 'crop-resize'
        
        w = event.pageX - startX + width
        h = event.pageY - startY + height

        output = null

        if w > container and h > container then return
        if w > container and h < container then output = container - x + 'px'
        if h > container and w < container then output = container - y + 'px'        
        if w < container and h < container then output = w - x + 'px'

        element.css { height: output, width: output }

      else

        posx = event.pageX - startX
        posy = event.pageY - startY

        if posx < (container - width)
          x = if posx < 0 then 0 else posx
        else
          x = (container - width)

        if posy < (container - height)
          y = if posy < 0 then 0 else posy
        else
          y = (container - height)

        element.css { top: y + "px", left: x + "px" }
        
        $( element.find('div')[0] ).css { backgroundPosition: ('-' + posx + 'px' + ' -' + posy + 'px') }

      return

    mouseup = () ->

      $document.off "mousemove", mousemove
      $document.off "mouseup", mouseup

      return

    return
]