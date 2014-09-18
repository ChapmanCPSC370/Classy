class PostsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_course, only: [:index, :new, :create, :post]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @course = Course.find(params[:course_id])
    @posts = @course.posts.all
    @user = current_user
    @post = @course.posts.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
  end

  # GET /posts/new
  def new
    @course = Course.find(params[:course_id])
    @post = @course.posts.new
    @user = current_user
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @course = Course.find(params[:course_id])
    @post = @course.posts.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to course_posts_path(@course), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @course = @post.course
    @post.destroy
    respond_to do |format|
      format.html { redirect_to course_posts_path(@course), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  
    def find_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user, :content, :user_id, :course)
    end
end
