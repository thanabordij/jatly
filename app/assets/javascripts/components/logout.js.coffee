@Logout = React.createClass

  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      url: '/users/sign_out.json'
      type: 'delete'
      data: { }
      success: (data) =>
        @props.setUser data
      dataType: "json"

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        'Logout'