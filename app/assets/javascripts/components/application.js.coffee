@Application = React.createClass
  getInitialState: ->
    show: false

  setUserSession: (data) ->
    @setState show: !@state.show

  render: ->
    React.DOM.div
      className: 'login-wrapper'
      if @state.show
        React.DOM.p null, "logged in successful"
      React.createElement Login, setUser: @setUserSession
      React.createElement Logout
      