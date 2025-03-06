
class CreatePostService
  attr_reader :post

  # delegate :save, to: :post

  def initialize(params, user)
    @post = Post.new(params.merge({user: user}))
  end

  def save
    # assign_ip_address(request)
    @post.save
  end

  def self.apply(post_params, user:)
    new(post_params, user)
  end

  private

  def assign_ip_address(hash)
    @post.ip_address = hash[:ip_address]
  end
end
