# encoding: UTF-8
require 'spec_helper'

test_hash = {
  "utf8" => "✓",
  "_method" => "put",
  "something" => {
    "nested1" => "3",
    "nested2" => "4"
  },
  "array" => [
    "1", "2", "3", "abc"
  ],
  "array of hashes" => [
    { "key 1"         => "val 1"        },
    { "ooh, nes<><><ting!" => ["x", "z", "y"]}
  ]
}

expected_html = <<HTML
<input id="utf8" name="utf8" type="hidden" value="✓" />
<input id="_method" name="_method" type="hidden" value="put" />
<input id="something_nested1" name="something[nested1]" type="hidden" value="3" />
<input id="something_nested2" name="something[nested2]" type="hidden" value="4" />
<input id="array_" name="array[]" type="hidden" value="1" />
<input id="array_" name="array[]" type="hidden" value="2" />
<input id="array_" name="array[]" type="hidden" value="3" />
<input id="array_" name="array[]" type="hidden" value="abc" />
<input id="array_of_hashes__key_1" name="array of hashes[][key 1]" type="hidden" value="val 1" />
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="x" />
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="z" />
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="y" />
HTML
expected_html.chomp!

describe ActionView::Base do
  describe "#hash_to_hidden_fields" do
    before :each do
      @hash_to_hidden_fields = ActionView::Base.new.hash_to_hidden_fields(test_hash)
    end

    it "produces the includes the correct tags" do
      # Ruby 1.8.7 doesn't have an ordered hash, hence this mess
      expected_html.lines.each do |tag|
        @hash_to_hidden_fields.should include(tag.chomp)
      end
    end

    it "is the right size" do
      @hash_to_hidden_fields.size.should == expected_html.size
    end
  end
end