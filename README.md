# README

* Basic Setup
- Clone this repo
- Run `bundle install` on the command line

* Database creation
- I used the most basic setup for this excersize. This repo uses sqlite3, so it should work right out of the box.
- run `bundle exec rake db:create db:migrate` on the command line

* How to run the test suite
- run `rspec` on the command line.

* Make the request
- I used curl to test this application, but feel free to use whatever you'd like.

## Note:
I turned off `Rails` standard security check of `verify_authenticity_token` for ease of use.

Here is an example request:

`curl -d '{"long_url":"https://kapost.com"}' -H "Content-Type: application/json" -X POST http://localhost:3000/short_links`

When you get your response body back in JSON form, copy the `short_link` and paste it into your browser. This will
redirect you to your original `long_url`.

### Notes
Some things I thought about but haven't built at this time:
- A uniqueness check on the `short_link` and retry if it had happened to duplicate a previous ShortLink.
- Sanitizing and validating the `long_url` on the way in.
