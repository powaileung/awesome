class MembersController < ApplicationController
  def create
    # Create the user from params
    @member = Member.new(member_params)
    if @member.save
      # Deliver the signup email
      MemberNotifierMailer.send_signup_email(@member).deliver
      redirect_to(@member, :notice => 'Member created')
    else
      render :action => 'new'
    end
  end

  private

  def member_params
    params.require(:member).permit(:member, :email, :login)
  end
end