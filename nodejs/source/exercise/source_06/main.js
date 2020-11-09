var http = require('http'); // http 관련 모듈 사용
var fs = require('fs');     // fs 관련 모듈 사용
var url = require('url');   // url 모듈 사용

function templatehtml(title, list, body){
  return `
  <!doctype html>
  <html>
  <head>
    <title>WEB1 - ${title}</title>
    <meta charset="utf-8">
  </head>
  <body>
    <h1><a href="/">WEB</a></h1>
    ${list}
    ${body}
  </body>
  </html>        
  `;
}

function templatelist(filelist){
  var list = '<ul>';
  for (var i=0; i<filelist.length; i++){
    list +=`<li><a href="/?id=${filelist[i]}">${filelist[i]}</li>`;
  }
  list +='</ul>';
  return list;
}

var app = http.createServer(function(request,response){
    var requestUrl = request.url;
    var queryData = url.parse(requestUrl, true).query;
    var pathname = url.parse(requestUrl, true).pathname;

    if(pathname === '/'){
      if(queryData.id === undefined){

        fs.readdir('./data', function(error, filelist){          
          var title = 'Welcome';
          var data = 'Hello node.js';
          var list = templatelist(filelist);
          var template = templatehtml(title, list, `<h2>${title}</h2>${data}`);

          response.writeHead(200); // 파일 전송이 성공
          response.end(template);
        });
      }else{
        fs.readdir('./data', function(error, filelist){
          fs.readFile(`data/${queryData.id}`, 'utf-8', function(err, data){
            var title = queryData.id;
            var list = templatelist(filelist);
            var template = templatehtml(title, list, `<h2>${title}</h2>${data}`);
            response.writeHead(200); // 파일 전송이 성공
            response.end(template);
          });
        });
      }
    }else{
      response.writeHead(404); // 파일 전송이 실패
      response.end('not found')
    }  
});
app.listen(3000); // 서버가 사용할 포트 번호 지정
