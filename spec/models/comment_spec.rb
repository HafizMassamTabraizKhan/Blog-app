require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update the post comment counter' do
    user = User.create(name: 'Massam')
    post = Post.create(author: user, title: 'Hello World')
    comment = Comment.create(author: user, post:)

    comment.update_post_comments_counter

    expect(post.reload.comments_counter).to eq(1)
  end
end
