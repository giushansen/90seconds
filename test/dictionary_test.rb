require_relative '../lib/dictionary'
require 'test/unit'

JSON_ENTITIES = [{"_id"=>1, "external_id"=>"74341f74-9c79-49d5-9611-87ef9b6eb75f", "name"=>"Raylan Givens", "created_at"=>"2016-04-15T05:19:46 -10:00", "active"=>true, "verified"=>true, "shared"=>false, "locale"=>"en-AU", "timezone"=>"Sri Lanka", "last_login_at"=>"2013-08-04T01:03:27 -10:00", "email"=>"test@example.com", "phone"=>"8335-422-718", "organization_id"=>119, "tags"=>["Springville", "Sutton", "Hartsville/Hartley", "Diaperville"], "suspended"=>true, "role"=>"admin"}, {"_id"=>2, "external_id"=>"c9995ea4-ff72-46e0-ab77-dfe0ae1ef6c2", "name"=>"Joni Mitchell", "alias"=>"Miss Joni", "created_at"=>"2016-06-23T10:31:39 -10:00", "active"=>true, "verified"=>true, "shared"=>false, "locale"=>"zh-CN", "timezone"=>"Armenia", "last_login_at"=>"2012-04-12T04:03:28 -10:00", "email"=>"test2@example.com", "phone"=>"9575-552-585", "signature"=>"Don't Worry Be Happy!", "organization_id"=>106, "tags"=>["Foxworth", "Woodlands", "Herlong", "Henrietta"], "suspended"=>false, "role"=>"member", "location"=>{"city"=>"Melbourne"}}].freeze

class TestDictionary < Test::Unit::TestCase
  def setup
    @dictionary = Dictionary.new(JSON_ENTITIES)
  end

  def test_nodes_only_grab_values
    assert_equal(@dictionary.nodes.count, 35)
    assert_equal(@dictionary['city'], nil)
  end

  def test_all_array_values_are_taken
    assert_not_equal(@dictionary['Foxworth'], nil)
    assert_not_equal(@dictionary['Woodlands'], nil)
    assert_not_equal(@dictionary['Herlong'], nil)
    assert_not_equal(@dictionary['Henrietta'], nil)
  end

  def test_all_hash_values_are_taken
    assert_not_equal(@dictionary['Melbourne'], nil)
  end

  def test_value_in_multiple_entities_has_all_ids
    assert_equal(@dictionary[true], Set.new([1,2]))
  end
end
