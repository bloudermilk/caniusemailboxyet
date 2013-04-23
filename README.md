# Can I Use Mailbox Yet?

This was a fun little hack I threw together on a Saturday. It polls the Mailbox
reservation API and sends live stats to the browser via socket.io. It attempts
to estimate your wait time by averaging the number of people let in per
minute. It's a pretty crude estimation but it seems to be accurate enough.

**Note:** Mailbox has since [opened their doors][fin] to all users who wish to
join, so this software is obsolete. Still, I hope it may serve as a good example
of how useful Node can be as a tool.

[fin]: http://www.mailboxapp.com/blog/?p=1#mailbox-now-available-without-the-wait

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

Once all the proper environment variables are set, you should be able to run the
server with the following command:

```bash
$ npm start
```

## Hacking the Mailbox reservation API

I used [this guide][https_guide] to intercept the HTTPS traffic on my iPhone and
grab the request parameters to send to the API. Once you're intercepting
traffic you need to open the app and let Mailbox check your position. You'll see
it making requests every 2-3 seconds. Click on any of these requests and look at
the request parameters and URL, then set the environment variables on your
machine based on that information.

[https_guide]: http://www.tuaw.com/2011/02/21/how-to-inspect-ioss-http-traffic-without-spending-a-dime/

## License

Copyright (c) 2013 Brendan Loudermilk

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
