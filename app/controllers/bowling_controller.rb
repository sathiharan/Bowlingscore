class BowlingController < ApplicationController
  def frame
    @bowling = Bowling.new(params, session[:frame])
       
    
    if @bowling.valid?
      
      @bowling.calc
      
    else
      flash[:error] = @bowling.errorMessage
    end
    
    #@bowling.calc        
    session[:frame] = @bowling.over? ? nil : @bowling.frame
    
    #render "bowling/sample"
    #flash.now[:alert] = 'Error while sending message!'

  end  
  
end
  