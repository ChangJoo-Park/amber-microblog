require "./spec_helper"

def post_comment_hash
  {"post_id" => "1", "body" => "Fake"}
end

def post_comment_params
  params = [] of String
  params << "post_id=#{post_comment_hash["post_id"]}"
  params << "body=#{post_comment_hash["body"]}"
  params.join("&")
end

def create_post_comment
  model = PostComment.new(post_comment_hash)
  model.save
  model
end

class PostCommentControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe PostCommentControllerTest do
  subject = PostCommentControllerTest.new

  it "renders post_comment index template" do
    PostComment.clear
    response = subject.get "/post_comments"

    response.status_code.should eq(200)
    response.body.should contain("Post Comments")
  end

  it "renders post_comment show template" do
    PostComment.clear
    model = create_post_comment
    location = "/post_comments/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Post Comment")
  end

  it "renders post_comment new template" do
    PostComment.clear
    location = "/post_comments/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Post Comment")
  end

  it "renders post_comment edit template" do
    PostComment.clear
    model = create_post_comment
    location = "/post_comments/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Post Comment")
  end

  it "creates a post_comment" do
    PostComment.clear
    response = subject.post "/post_comments", body: post_comment_params

    response.headers["Location"].should eq "/post_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a post_comment" do
    PostComment.clear
    model = create_post_comment
    response = subject.patch "/post_comments/#{model.id}", body: post_comment_params

    response.headers["Location"].should eq "/post_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a post_comment" do
    PostComment.clear
    model = create_post_comment
    response = subject.delete "/post_comments/#{model.id}"

    response.headers["Location"].should eq "/post_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
