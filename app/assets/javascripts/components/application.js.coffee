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
    React.DOM.div
      className: 'login-signup-container'
      React.DOM.h3 null, 'Hello World'
      React.createElement Logout, setUser: @setUserSession

  showLoginSignupForm: ->
    React.DOM.div
      className: 'login-signup-container'
      React.DOM.h1
        className: 'app-title'
        'Welcome'
      React.createFactory(React.addons.CSSTransitionGroup)
        transitionName: 'login-transition'
        transitionLeave: false
        if !@state.showLogin
          switchText = 'Signup'
          React.createElement Login, key: 10, setUser: @setUserSession, handleErrorResponse: @setErrors
        else
          switchText = 'Login'
          React.createElement Signup, key: 11, setUser: @setUserSession, handleErrorResponse: @setErrors
      React.DOM.button
        className: 'btn btn-primary btn-block'
        id: 'toggle-login-signup-btn'
        onClick: @toggleLogin
        "Click here to #{ switchText }"

  showPrettyLoginWall: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-4 col-md-offset-4'
          React.DOM.div
            className: 'login-wall'
            if @state.userSession
              @showSuccessfulLogin()
            else
              @showLoginSignupForm()

  render: ->
    React.DOM.div
      className: 'application-wrapper'
      if @state.errorMessages.length > 0
        @displayErrors()
      @showPrettyLoginWall()

  displayErrors: ->
    i = 0
    for message in @state.errorMessages
      React.createElement AlertBox, key: i++, type: "danger", message: message