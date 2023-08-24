require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save user without name' do
    user = User.new
    expect(user.valid?).to eq false
  end

  it 'should save user with valid attributes' do
    user = User.new(name: 'John Doe', posts_counter: 0)
    expect(user.valid?).to eq true
  end

  it 'should not save user with negative posts_counter' do
    user = User.new(name: 'Jane Smith', posts_counter: -1)
    expect(user.valid?).to eq false
  end

  it 'should not save a user if posts_counter is not an integer' do
    user = User.new(name: 'Alice Johnson', posts_counter: 'Hi')
    expect(user.valid?).to eq false
  end

  it 'retrieves recent posts' do
    user = User.create(name: 'Bob Anderson', posts_counter: 0)
    expect(user.valid?).to eq true

    3.times { Post.create(author: user, title: 'Hello World', text: 'This is my first post') }
    expect(user.three_most_recent_posts.to_a).to eq user.posts.order(created_at: :desc).limit(3).to_a
  end
end
