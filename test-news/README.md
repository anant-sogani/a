# News Headlines Via REST API

## Introduction
Create an HTML page that retrieves news headlines via a REST API,
and prints them out in a nice format.

For this assignment, focus on a particular newspaper, The Times of India.

## REST API
Explore [News API](https://newsapi.org/s/the-times-of-india-api) to learn
how to obtain the **Top Headlines** from The Times of India.

You will have to register on the News API site in order to obtain an API
key. This key will be required to authorize all your HTTP GET requests.

## Javascript
The REST API invocation must be done in Javascript running on your HTML
page. See this [link](https://stackoverflow.com/questions/36975619/how-to-call-a-rest-web-service-api-from-javascript) on how that can be done.

## Input
A simple HTML submit button. See [sample](https://github.com/anant-sogani/a/blob/master/test-news/input.png).

## Processing
Clicking the button should trigger your Javascript code, that would then
need to do the following:
- Fetch The Times of India news headlines using News API.
- Render the headlines on the HTML page.

## Output
A neat list of headlines. See [sample](https://github.com/anant-sogani/a/blob/master/test-news/output.png).

## Note
All *your* code runs on the client side (in the browser). **No** server side
scripting is needed.
