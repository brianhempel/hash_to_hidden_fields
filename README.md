# HashToHiddenFields [![Build Status](https://secure.travis-ci.org/brianhempel/hash_to_hidden_fields.png)](http://travis-ci.org/brianhempel/hash_to_hidden_fields)

Sometimes in your Rails app you want to allow a user to begin an action, log in, then complete the action. The traditional way to handle this is to smash your params into the session, let the user log in, then pull the params out of the session if the login is successful. A better way is to have the login form resubmit the params.

Add to your Gemfile:

```ruby
gem "hash_to_hidden_fields"
```

Then turn a hash into hidden fields in your form:

```erb
<%= hash_to_hidden_fields(@params_to_save) %>
```

When the form is submitted again, all the old params will come through as well!

## Help make it better!

Find a problem? [Open an issue](https://github.com/brianhempel/hash_to_hidden_fields/issues). Or, even better, code it yourself and send a pull request:

    # fork it on github, then clone:
    git clone git@github.com:your_username/hash_to_hidden_fields.git
    bundle install
    rspec
    # hack away
    git push
    # then make a pull request

## License

Public domain; no restrictions.