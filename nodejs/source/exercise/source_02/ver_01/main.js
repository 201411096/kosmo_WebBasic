var http = require('http'); // http 관련 모듈 사용
var fs = require('fs');     // fs 관련 모듈 사용
var url = require('url');   // url 모듈 사용
var app = http.createServer(function(request,response){
    var requestUrl = request.url;
    var queryData = url.parse(requestUrl, true).query;
    console.log(queryData.id)
    console.log(requestUrl) // querystring도 request.url에 들어가있음
    if(requestUrl == '/'){
        requestUrl = '/index.html';
    }
    if(requestUrl == '/favicon.ico'){
      return response.writeHead(404);
    }
    response.writeHead(200);
    response.end(fs.readFileSync(__dirname + requestUrl));
    // response.end('egoing : ' + url); // 결과 내용이 이해가 안됨
    // response.end(queryData.id) // querystring에 따라 html이 ..?
 
});
app.listen(3000); // 서버가 사용할 포트 번호 지정

/* 
0. 서버 돌린 후 접속 경로
    ㄴ http://localhost:3000/index.html
    ㄴ http://192.168.56.1:3000/index.html
    ㄴ http://ip번호:포트번호/...

1. 서버 실행
    ㄴ 실행시킬 파일 위치에서..
    ㄴ node filename
    
2. 서버 종료
    ㄴ ctrl - c

*/