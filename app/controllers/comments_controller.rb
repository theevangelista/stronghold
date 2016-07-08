# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET issues/1/comments
  # GET issues/1/comments.json
  def index
    @comments = Comment.all
  end

  # GET issues/1/comments/1
  # GET issues/1/comments/1.json
  def show
  end

  # POST issues/1/comments
  # POST issues/1/comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.issue, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@comment.issue, @comment] }
      else
        format.html { redirect_to @comment.issue }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT issues/1/comments/1
  # PATCH/PUT issues/1/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.issue, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@comment.issue, @comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE issues/1/comments/1
  # DELETE issues/1/comments/1.json
  def destroy
    comment_issue = @comment.issue
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to issue_path(comment_issue), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :issue_id)
  end
end
