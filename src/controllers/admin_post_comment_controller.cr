class AdminPostCommentController < ApplicationController
  def index
    post_comments = PostComment.all
    render("index.slang")
  end

  def show
    if post_comment = PostComment.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "PostComment with ID #{params["id"]} Not Found"
      redirect_to "/post_comments"
    end
  end

  def new
    post_comment = PostComment.new
    render("new.slang")
  end

  def create
    post_comment = PostComment.new(post_comment_params.validate!)
    puts "#{post_comment_params}"
    if post_comment.valid? && post_comment.save
      flash["success"] = "Created PostComment successfully."
      redirect_to "/post_comments"
    else
      flash["danger"] = "Could not create PostComment!"
      render("new.slang")
    end
  end

  def edit
    if post_comment = PostComment.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "PostComment with ID #{params["id"]} Not Found"
      redirect_to "/post_comments"
    end
  end

  def update
    if post_comment = PostComment.find(params["id"])
      post_comment.set_attributes(post_comment_params.validate!)
      if post_comment.valid? && post_comment.save
        flash["success"] = "Updated PostComment successfully."
        redirect_to "/post_comments"
      else
        flash["danger"] = "Could not update PostComment!"
        render("edit.slang")
      end
    else
      flash["warning"] = "PostComment with ID #{params["id"]} Not Found"
      redirect_to "/post_comments"
    end
  end

  def destroy
    if post_comment = PostComment.find params["id"]
      post_comment.destroy
    else
      flash["warning"] = "PostComment with ID #{params["id"]} Not Found"
    end
    redirect_to "/post_comments"
  end

  def post_comment_params
    params.validation do
      required(:post_id) { |f| !f.nil? }
      required(:user_id) { |f| !f.nil? }
      required(:body) { |f| !f.nil? }
    end
  end
end
