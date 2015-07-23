@AlertBox = React.createClass
  render: ->
    React.DOM.div
      className: "alert alert-#{ @props.type }"
      role: "alert"
      @props.message