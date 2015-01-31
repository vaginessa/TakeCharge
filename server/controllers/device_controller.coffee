Firebase = require 'firebase'

deviceController = {}

deviceController.index = (req, res) ->
  firebase = new Firebase('https://takecharge.firebaseio.com/')
  firebase.once('value', (snapshot) ->
    devices = []
    snapshot.forEach((child) ->
      devices.push({
        id: child.key()
        name: child.val().userinfo.name
      })
    )
    res.render 'index', {
      devices: devices
    }
  )

deviceController.show = (req, res) ->
  firebase = new Firebase('https://takecharge.firebaseio.com/')
  firebase.child(req.params.id).once('value', (snapshot) ->
    res.render('device', {
      device: snapshot.val()
    })
  )

module.exports = deviceController
