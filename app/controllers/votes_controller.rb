class VotesController < ApplicationController
    before_filter :authenticate_voter!
  # GET /votes
  # GET /votes.json
  # before_filter :signed_in?!
  def index
    @votes = Vote.where(:voter_id => current_voter.id)
    @votes_for_candidates = Candidate.all.collect { |c| [c.name, c.votes.count, c.votes.count.to_f / Vote.count]}


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])
    @vote_for_candidate = @vote.candidate.name
    @vote_time = @vote.created_at
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new
    @candidates = Candidate.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  # def edit
  #   @vote = Vote.find(params[:id])
  # end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @vote.voter = current_voter
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  # def update
  #   @vote = Vote.find(params[:id])

  #   respond_to do |format|
  #     if @vote.update_attributes(params[:vote])
  #       format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @vote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /votes/1
  # DELETE /votes/1.json
  # def destroy
  #   @vote = Vote.find(params[:id])
  #   @vote.destroy

  #   respond_to do |format|
  #     format.html { redirect_to votes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
