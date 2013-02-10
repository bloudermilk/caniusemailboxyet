# Can I Use Mailbox Yet?

This was a fun little hack I threw together on a Saturday. It polls the Mailbox
reservation API and sends live stats to the browser via socket.io. It attempts
to estimate your wait time by averaging the number of people let in per
minute. It's a pretty crude estimation but it seems to be accurate enough.

## Setup

If you'd like to run this yourself, you need to [hack the mailbox
API](#hacking-the-mailbox-reservation-api) and set the required environment
vairables:

* `UUID`
* `VERSION`
* `LINE_NUMBER`
* `CHECKSUM`
* `URL`

By default, the server will run on port 8000. You can change this by
setting the `PORT` environment variable.

## Hacking the Mailbox reservation API

I used [this guide](https_guide) to intercept the HTTPS traffic on my iPhone and
grab the request parameters to send to the API.

[https_guide]: http://www.tuaw.com/2011/02/21/how-to-inspect-ioss-http-traffic-without-spending-a-dime/
