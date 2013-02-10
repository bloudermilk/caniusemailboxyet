# Misc deps
request = require("request")

# App + Socket
app = require("express")()
server = app.listen(process.env.PORT || 8000, "0.0.0.0")
io = require("socket.io").listen(server)

# Heroku settings
io.set("transports", ["xhr-polling"])
io.set("polling duration", 10)

# Config
URL = process.env.URL
CACHE_LENGTH = 60

formData =
  uuid: process.env.UUID
  version_number: process.env.VERSION
  line_number: process.env.LINE_NUMBER
  checksum: process.env.CHECKSUM

app.get("/", (req, res) ->
  res.sendfile(__dirname + "/public/index.html")
)

seed = []

io.sockets.on("connection", (socket) ->
  socket.emit("seed", {
    data: seed
    cacheLength: CACHE_LENGTH
  })
)

setInterval(->
  request.post(URL, form: formData, (error, response, body) ->
    json = JSON.parse(body)

    delete json.allowed # Ain't nobody got time for that

    io.sockets.emit("update", json)

    seed.push(json)

    seed.shift() if seed.length > CACHE_LENGTH
  )
, 1000)
