# App + Socket
app = require("express")()
server = app.listen(process.env.PORT || 8000, "0.0.0.0")

app.get("/", (req, res) ->
  res.sendfile(__dirname + "/public/index.html")
)
