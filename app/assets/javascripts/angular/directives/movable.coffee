App.directive "myDraggable", [ "$document", ($document) ->
  return (scope, element, attr) ->

    container = 300

    startX = 0
    startY = 0

    x = 0
    y = 0

    type = null
    width = null

    element.on "mousedown", (event) ->
    
      event.preventDefault()
      
      startX = event.pageX - x
      startY = event.pageY - y

      type = event.target.className
      width = element.width()

      $document.on "mousemove", mousemove
      $document.on "mouseup", mouseup

      return

    mousemove = (event) ->

      if type == 'crop-resize'
        
        w = event.pageX - startX + width

        if w > container then w = container
        if w < 100 then w = 100

        element.css { height: w - x + 'px', width: w - x + 'px' } # to resize with contrains

      else

        posx = event.pageX - startX
        posy = event.pageY - startY

        if posx < (container - width)
          x = if posx < 0 then 0 else posx
        else
          x = (container - width)

        if posy < (container - width)
          y = if posy < 0 then 0 else posy
        else
          y = (container - width)

        element.css { top: y + "px", left: x + "px" }

      return

    mouseup = () ->

      $document.off "mousemove", mousemove
      $document.off "mouseup", mouseup

      return

    return
]