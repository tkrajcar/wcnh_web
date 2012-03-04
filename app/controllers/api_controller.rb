class ApiController < ApplicationController
  EVENTS = %w[ test user_register ].freeze
  FORMAT = :json

  def dispatch_handler
    event = params[:event]
    unless EVENTS.include? event
      render :nothing => true, :status => 501 and return
    end

    begin
      self.send event
    rescue Exception => e
      logger.error e
      logger.error e.backtrace
      render :nothing => true, :status => 422 and return
    end
  end

  def test
    render :nothing => true, :status => 200
  end

  def user_register
    if(params[:email].nil? || params[:password].nil? || params[:current_dbref].nil? || params[:current_name].nil?)
      render :nothing => true, :status => 400 and return
    end

    user = User.find_or_create_by(email: params[:email])

    user.password = params[:password]
    user.current_dbref = params[:current_dbref] unless user.current_dbref == params[:current_dbref]
    user.name = params[:current_name] unless user.name == params[:current_name]

    if user.save == true
      render FORMAT => {:success => true, :message => "Registration completed."} and return
    else
      render FORMAT => {:success => false, :message => user.errors.full_messages.to_sentence}
    end
  end
end
