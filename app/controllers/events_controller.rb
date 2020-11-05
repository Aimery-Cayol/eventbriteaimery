class EventsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :show]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(title: params[:title], description: params[:description], start_date: params[:start_date],
      duration: params[:duration], price: params[:price], location: params[:location])
    if @event.save
     
      redirect_to root_path, notice:"Ton évènement a été créé !"
    else
      flash[:alert] = "L'évènement n'a pas pu être créé."
      redirect_to new_event_path
    end
  end

  def show
    @event = set_event
  end

  def edit
    @event = set_event
  end

  def update
    @event = set_event
    @event.update(title: params[:title], description: params[:description], start_date: params[:start_date],
      duration: params[:duration], price: params[:price], location: params[:location])
    if @event.save
    
      redirect_to root_path, notice:"Ton évènement a été mis à jour !"
    else
      flash[:alert] = "L'évènement n'a pas pu être mis à jour"
      redirect_to event_path(@vent.id)
    end
  end



  def subscribe
    @event = Event.find(params[:id]) 

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


  private

  def set_event
    Event.find(params[:id])
  end

end
