# jQuery

jQuery is a JavaScript library that builds on top of the DOM's functionality.

When running JavaScript code in the browser, the browser provides an API by which JavaScript code can access the HTML content of a page. This API is called the Document Object Model. The DOM API is standardized by the World Wide Web Consortium (W3C).

`<script src="https://ajax.googleapis.com/ajax"/>`

# DOM

To change waht we can see on the page, we can manipulate the DOM using JavaScript.

_Take JavaScript and change HTML_

# jQuery

Library since 2006. It is a JavaScript wrapper libary used for low level manipulation.

Used by 73% of top 10,000,000 sites. It is supported universally supported by all browsers. It is consistent API for programmers to interface regardless of browser. Write less, do more.

Whereas `document.querySelectorAll("li")` returns a NodeList, `$("li")` returns a jQuery object.

THE `$` represents a wrapper function that creates jquery objects.

A jQuery object, like a NodeList, is array like; you can ask for its length, and you can lookup a value by index. Like a NodeList, the items in a jQuery object are regular DOM HTMLElements.

# Ways to use jQuery

- wrapper-style
  - input: unwrapped HTML element or array of seevral elements.
  - output: jQuery object wrapping those elements, giving you access to jQuery methods.
  - abstract unless you see it.
  - `$(someHTMLVariable)`

- selector-style
  - input: CSS selector as a string
  - output: jQuery object(array-like) containing all elements taht match the selector.
  - `$('li.someClass')`

- HTML-style
  - input: HTML code as a string
  - output: jQuery object containing the top-level elements you built.
  - `$('<li class="somecClass">')`

- ready-style
  - input: function to run when DOM is fully loaded.
  - `$(() => alert('DOM is fully loaded'))`

## Methods
  - `const $listItems = $("li");`
  - `jQuery#addClass`
  - `hide` and `show`
  - `css`
  - `attr` and `data`
  - `val()`
  - `.on(event, handler)`

# DOM Functionality

- `document.getElementById(selector)`
- `document.getElementsByClassName(selector)`
- `document.querySelectorAll(selector)`
- `.attr('type','password')`
- `.attr('value','eat a taco')`
- `.data`

# Events

This dynamic modification of the HTML document would be pointless without event handling. They describe most interactions uses can have with an app.

To respond, we must install event listeners on HTML elements(`on`)

_currentTarget is the element where the event is listener is attached to - the element that has the handler event on it_

_target is the element that the event occured on - the event that was clicked on_

Events are the means by which JavaScript can react to user behavior. Some common events:

- click, dblclick
- input, change, submit
- keydown, keyup
- mouseover, mousemove, mouseout
- scroll, resize

# Event Functionality

- `.addEventListener("mouseover", () => {
    alert("YOU MOUSED OVER ME!");
  });`
