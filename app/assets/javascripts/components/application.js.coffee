@Application = React.createClass
  getInitialState: ->
    show: Cookies.get('signed_in') == '1'
    errorMessages: []

  setUserSession: (data) ->
    @state.show = !@state.show
    @setState errorMessages: []

  setErrors: (errors) ->
    @setState errorMessages: errors

  render: ->
    React.DOM.div
      className: 'application-wrapper'
      if @state.errorMessages.length > 0
        @displayErrors()

      React.DOM.div
        className: 'login-wrapper'
        if @state.show
          React.DOM.div null,
            React.DOM.p null, 'logged in successful'
            React.createElement Logout, setUser: @setUserSession
        else
          React.DOM.div null,
            React.createElement Login, setUser: @setUserSession, handleErrorResponse: @setErrors
            React.createElement Signup, setUser: @setUserSession, handleErrorResponse: @setErrors

  displayErrors: ->
    i = 0
    for value in @state.errorMessages
      React.DOM.p
        key:i++
        value
