# Installation

based on [nephos-server](https://github.com/pouleta/NephosRubyServer)

```bash
# set your env
# FACEBOOK_USERNAME
# FACEBOOK_PASSWORD
cd FacebookPoker
bundle install
nephos-server
curl "http://localhost:8080/pokes/return/60" # to return all poke for 60 seconds
```

# TODO

- /pokes/return/:time in background job
- status
