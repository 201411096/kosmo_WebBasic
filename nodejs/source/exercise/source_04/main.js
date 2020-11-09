var http = require('http'); // http 관련 모듈 사용
var fs = require('fs');     // fs 관련 모듈 사용
var url = require('url');   // url 모듈 사용
var app = http.createServer(function(request,response){
    var requestUrl = request.url;
    var queryData = url.parse(requestUrl, true).query;
    var title = queryData.id;
    if(requestUrl == '/'){
        title = 'Welcome'
    }
    if(requestUrl == '/favicon.ico'){
      return response.writeHead(404);
    }
    response.writeHead(200);
    fs.readFile(`data/${title}.txt`, 'utf-8', function(err, data){
      var template = `
      <!doctype html>
      <html>
      <head>
        <title>WEB1 - ${title}</title>
        <meta charset="utf-8">
      </head>
      <body>
        <h1><a href="/">WEB</a></h1>
        <ol>
        <li><a href="/?id=HTML">HTML</a></li>
        <li><a href="/?id=CSS">CSS</a></li>
        <li><a href="/?id=JavaScript">JavaScript</a></li>
        </ol>
        <h2>${title}</h2>
        <p>${data}</p>
      </body>
      </html>
      
      `;
      response.end(template);
    });
});
app.listen(3000); // 서버가 사용할 포트 번호 지정
