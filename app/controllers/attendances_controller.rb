class AttendancesController < ApplicationController


  def new
    @event = Event.find(params[:id]) 
=begin
    if @event.attendees.include? current_user
      flash[:error] = "Vous participez déjà à l'événement"
      redirect_to @event
    end
=end
      ##########
      @amount = @event.price

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })

      @event/attendees << current_user
      flash[:success] = "Vous participez à l'événement !"
      redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event
    
  end 

  def index
  end
end
