# app/controllers/posts_controller.rb
# frozen_string_literal: true

# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @posts = Current.tenant.posts.all
  end

  # GET /posts/1
  def show
    # Action body can be empty as set_post handles the data
  end

  # GET /posts/new
  def new
    @post = Current.tenant.posts.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = Current.tenant.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: t('posts.created')
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.updated')
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('posts.destroyed')
  end

  private

  def set_post
    # Finding through the tenant relation ensures data isolation
    @post = Current.tenant.posts.find(params[:id])
  end

  def post_params
    params.expect(post: %i[title body published_at])
  end
end
