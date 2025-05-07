// cpu-api.js
import http from 'http';

http.createServer((req, res) => {
  if (req.url === '/cpu') {
    const start = Date.now();
    while (Date.now() - start < 500) {
      console.log("While Loop");
    } // 500ms of CPU burn
    res.writeHead(200);
    res.end('CPU load simulated');
  } else {
    res.writeHead(404);
    res.end('Not Found');
  }
}).listen(3001, () => {
  console.log('CPU load server running on port 3001');
});
