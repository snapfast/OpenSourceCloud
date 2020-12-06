
## Why CDN ?
Content delivery network is used to get the content from the edge server, instead of getting the content from origin server.

CDN architecture is designed to handle the very large amount of bandwidth usage by providing ample resources and network capabilities. This minimizes the risk of overloading the origin server. CDN helps increase reliability, if POP(point of presence) goes down, traffic gets rerouted to a different POP - increasing redundancy.
Edge server --

#### Benefits of CDN
- Speed; get content from closest edge server
- Scalability; get performance improvement; since majority content is delivered from CDN
- Origin; gets high uptime; lower chance of failure
- Security; provides DDoS resistance; traffic is more on the CDN server
- ability to handle large loads, in case of sudden spike in traffic

> closest edge servers for CDN are used for the sending data to the user. If origin server can take around 400 ms, meanwhile closest edge server might take around 100ms.


#### CDN Design

CDN is spread across based on the Customer need and application requirements.
User location is SF > Route53 > Edge Server

Edge server has a web server which is configured to get the latest content changes from the Origin Server, to always serve the fresh content.

#### Production issues of CDN

- CDN delivers delayed content to customers
- Caching issues - shows old content, refresh the cache is solution

