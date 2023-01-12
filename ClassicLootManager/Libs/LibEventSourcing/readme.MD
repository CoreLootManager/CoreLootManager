# Event sourcing for WoW

WoW addons often need to keep some sort of state across multiple clients. A typical example is DKP or guild loot history.
The challenge with keeping complex state is often sync and merge.

This library solves the sync problem by using event sourcing.

- We store simple events with a timestamp (4bytes), a creator ID (4bytes), a counter (1 byte)
- Events are absolutely ordered using a custom function
- State is deterministically derived by executing handlers for each event in order
- The event log from now on called the ledger, is insert only, no events can be removed from it

Having an insert only data store allows us to simplify synchronization.
We use an authorization handler to allow library consumers to decide their trust model, before any event is added to the local store
or sent out over any broadcast channel, the authorization handler is called.

## UI Freezes

One common problem of sending large data sets is the UI freezing when data is serialized or unserialized.
This library will sync smaller data sets to prevent this freeze.
Playing events (ie calculating state) is done in batches on a recurring timer. This gives us 2 knobs (batchsize, interval)
to play with to reduce noticable lag.

## Performance

Initial testing shows us that replaying events can be done at a speed of roughly 10.000/s.
For our use cases this should be fine, consumers should implement snapshotting when they expect to go over that amount

## Pruning
TBD

## Syncing

We use unix timestamps across this library. To get the weeknumber for a timestamp we simply divide by 604800, this gives us
a unix week number. We hash the unique keys using Adler32, we implemented the algorithm using a coroutine.
Hashing is very fast and allows us to quickly determine change sets between agents.

The initial idea for sync is as follows:
- Sync should be stateless as much as possible
- Senders (ie agents that have sending enabled) should advertise their last 4 week hashes on an interval
- If an agent receives a hash that is different from their local hash, they should request the week data
- When a sender receives this request they broadcast the data for the week.

To prevent a lot of noise we use inhibitors. (NOT FULLY THOUGHT OUT)
- Don't send week data that was sent < x seconds ago
- Don't send week data that someone else with priority will be sending
- Don't request a week that someone else has requested
- Don't advertise a hash that someone else has advertised

Then there is the issue of responding to requests on broadcast channels. We don't want every sender to immediately spam the channel
with data...

- When announcing that you are able to send a hash include a timestamp.
- If multiple announcements are sent simultaneously, only the sender with the lowest timestamp (and player name in case of same timestamp) 
  will start sending data after at 5 seconds.  

  
Denial of service
-----------------
The consuming addon is responsible for providing secure communication channels.
Specifically if we can only authorize entries but not sync messages someone can
block sync by rebroadcasting every advertisement with a lower timestamp and then never sending actual data.


# Contributions

As much as possible is automated when it comes to chores in this library.

- Run `npm install`, this will set up the commit linter as well as git hooks
- We use conventional commits (https://www.conventionalcommits.org/en/v1.0.0/) for standardizing commit messages
- We use semantic-release (https://semantic-release.gitbook.io/semantic-release/) for automated releases
- We use gitman (https://gitman.readthedocs.io/en/latest/) for dependency management
