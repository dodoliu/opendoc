require 'test_helper'
require 'generators/abc/abc_generator'

class AbcGeneratorTest < Rails::Generators::TestCase
  tests AbcGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
