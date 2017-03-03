require 'test_helper'
require 'generators/opendoc_scaffold/opendoc_scaffold_generator'

class OpendocScaffoldGeneratorTest < Rails::Generators::TestCase
  tests OpendocScaffoldGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
