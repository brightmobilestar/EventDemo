We have setup an API that serves a list of events and the guest who are attending each event, the
endpoints are defined as such:
Events:
http://104.236.141.246/api/events
This will return you a json encoded list of all events.
Guests:
http://104.236.141.246/api/guests/:id
Id is the event id of any given event.
example:
http://104.236.141.246/api/guests/1 - this will return a json encoded list of all guests going to the event
with id = 1
The task is to create an iOS app to load and display the event details and guest list, it is completely up to
you how the app is laid out, the only requirement is that all data should be represented in some form.
We are interested in both the quality of code and UI design.
