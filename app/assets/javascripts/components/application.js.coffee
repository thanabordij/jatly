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

  toggleLogin: ->
    @setState showLogin: !@state.showLogin

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
      React.DOM.button
        className: 'btn btn-primary btn-block'
        id: 'toggle-login-signup-btn'
        onClick: @toggleLogin
        "Click here to #{ switchText }"

  render: ->
    React.DOM.div
      className: 'application-wrapper'
      if @state.errorMessages.length > 0
        @displayErrors()

      React.DOM.div
        className: 'container'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4 col-md-offset-4'
            React.DOM.div
              className: 'account-wall'
              if @state.userSession
                @showSuccessfulLogin()
              else
                @showLoginSignupForm()

  displayErrors: ->
    i = 0
    for message in @state.errorMessages
      React.createElement AlertBox, key: i++, type: "danger", message: message