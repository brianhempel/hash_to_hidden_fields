# encoding: UTF-8
require 'spec_helper'

test_hash = {
  "utf8" => "✓",
  "_method" => "put",
  "something" => {
    "nested1" => "3",
    "nested2" => "4"
  },
  "nil" => nil,
  "array" => [
    1, 2, "3", "abc"
  ],
  "array of hashes" => [
    { "key 1"         => "val 1"        },
    { "ooh, nes<><><ting!" => ["x", "z", "y"]}
  ]
}

# Ruby 1.8.7 doesn't have an ordered hash, hence this mess
# want to make sure arrays come back in the correct order
expected_html_blocks = [
'<input type="hidden" name="utf8" id="utf8" value="✓" />',
'<input type="hidden" name="_method" id="_method" value="put" />',
'<input type="hidden" name="something[nested1]" id="something_nested1" value="3" />',
'<input type="hidden" name="something[nested2]" id="something_nested2" value="4" />',
<<-HTML,
<input type="hidden" name="array[]" id="array_" value="1" />
<input type="hidden" name="array[]" id="array_" value="2" />
<input type="hidden" name="array[]" id="array_" value="3" />
<input type="hidden" name="array[]" id="array_" value="abc" />
HTML
'<input type="hidden" name="array of hashes[][key 1]" id="array_of_hashes__key_1" value="val 1" />',
<<-HTML,
<input type="hidden" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" id="array_of_hashes__ooh__nes_____ting__" value="x" />
<input type="hidden" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" id="array_of_hashes__ooh__nes_____ting__" value="z" />
<input type="hidden" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" id="array_of_hashes__ooh__nes_____ting__" value="y" />
HTML
]
expected_html_blocks.map!(&:chomp)

describe ActionView::Base do
  describe "#hash_to_hidden_fields" do
    before :each do
      @hash_to_hidden_fields = ActionView::Base.new.hash_to_hidden_fields(test_hash)
    end

    it "produces the correct tags" do
      # Ruby 1.8.7 doesn't have an ordered hash, hence this mess
      expected_html_blocks.each do |tags|
        @hash_to_hidden_fields.should include(tags)
      end
    end

    it "is the right size" do
      @hash_to_hidden_fields.size.should == expected_html_blocks.join("\n").size
    end
  end
end
