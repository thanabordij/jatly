@Application = React.createClass
  getInitialState: ->
    userSession: Cookies.get('signed_in') == '1'
    errorMessages: []
    showLogin: false

  setUserSession: (data) ->
    @state.userSession = !@state.userSession
    @setState errorMessages: []

  setErrors: (errors) ->
    @setState errorMessages: errors

  toggleLogin: (e) ->
    @setState showLogin: !@state.showLogin
    e.preventDefault()

  showSuccessfulLogin: ->
    React.DOM.div null,
      React.DOM.p null, 'logged in successful'
      React.createElement Logout, setUser: @setUserSession

  showLoginSignupForm: ->
    React.DOM.div
      className: 'login-signup-container'
      if !@state.showLogin
        switchText = 'Signup'
        React.createElement Login, setUser: @setUserSession, handleErrorResponse: @setErrors
      else
        switchText = 'Login'
        React.createElement Signup, setUser: @setUserSession, handleErrorResponse: @setErrors
      React.DOM.form
        className: 'form-inline'
        onSubmit: @toggleLogin
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          "Click here to #{ switchText }"

  render: ->
    React.DOM.div
      className: 'application-wrapper'
      if @state.errorMessages.length > 0
        @displayErrors()

      React.DOM.div
        className: 'login-wrapper'
        React.DOM.div
          className: 'container'
          React.DOM.div
            className: 'row'
            id: 'login-container'
            React.DOM.div
              className: 'col-sm-6 col-md-4 col-md-offset-4'
              React.DOM.div
                className: 'panel panel-default'
                React.DOM.div
                  className: 'panel-body'
                  if @state.userSession
                    @showSuccessfulLogin()
                  else
                    @showLoginSignupForm()

  displayErrors: ->
    i = 0
    for message in @state.errorMessages
      React.createElement AlertBox, key: i++, type: "danger", message: message