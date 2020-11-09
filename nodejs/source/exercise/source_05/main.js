process = require('process'); // process 모듈 사용

var processargs = process.argv;
console.log(processargs);
console.log(processargs[2]);

if(processargs[3]==='1'){
    console.log('c1');
}else{
    console.log('c2')
}