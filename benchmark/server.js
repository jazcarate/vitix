var url = require('url');
var http = require("http");


var server = http.createServer(function(request, response) {
  var urlParts = url.parse(request.url, true);
  var query = urlParts.query;

  response.write("a".repeat(parseInt(query.payload) || 1))
  response.end();
});

const port = process.argv[2] || 8000;

server.listen(port);
console.log("Server is listening at " + port);