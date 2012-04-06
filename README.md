# HashToHiddenFields [![Build Status](https://secure.travis-ci.org/brianhempel/hash_to_hidden_fields.png)](http://travis-ci.org/brianhempel/hash_to_hidden_fields)

Sometimes in your Rails app you want a user to begin an action, log in, then complete the action. You smash their params into the session, let the user log in, then pull their params out of the session when the login is successful. END SESSION STORE ABUSE! A better way is to have the login form resubmit the params.

Add this to your Gemfile:

``` ruby
gem "hash_to_hidden_fields"
```

Filter the params you want to save and turn them into hidden fields in your form:

``` erb
<%= hash_to_hidden_fields(@params_to_save) %>
```

When the form is submitted, all the old params will come through! Nested arrays and nested hashes are all preserved.

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