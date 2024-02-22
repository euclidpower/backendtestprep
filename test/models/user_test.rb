# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'factory' do
    assert_predicate build(:user), :valid?
  end

  test 'nil name' do
    assert_not_predicate build(:user, name: nil), :valid?
  end

  test 'blank name' do
    assert_not_predicate build(:user, name: ''), :valid?
  end

  test 'long name' do
    assert_not_predicate build(:user, name: 'a' * (255 + 1)), :valid?
  end

  test 'nil api_key' do
    user = build(:user, api_key: nil)

    assert_predicate user, :valid?

    user.save

    assert_not_empty user.api_key
  end

  test 'blank api_key' do
    assert_not_predicate build(:user, api_key: ''), :valid?
  end

  test 'short api_key' do
    assert_not_predicate build(:user, api_key: SecureRandom.hex(25)[0..22]), :valid?
  end

  test 'long api_key' do
    assert_not_predicate build(:user, api_key: SecureRandom.hex(255)[0..256]), :valid?
  end

  test 'malformed api_key' do
    assert_not_predicate build(:user, api_key: '?' * 64), :valid?
  end

  test 'duplicate api_key' do
    user = create :user

    assert_not_predicate build(:user, api_key: user.api_key), :valid?
  end
end
