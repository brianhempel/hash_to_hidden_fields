require 'hash_to_hidden_fields/version'
require 'action_view/helpers/hash_to_hidden_fields'

class ActionView::Base
  include ActionView::Helpers::HashToHiddenFields
end
