class Bowling < ActiveRecord::Base
  attr_accessible :ball, :score, :total
 
  
attr_reader :errorMessage, :frameNumber, :frame

  FRAMES = 10
  PINS   = 10

  def initialize(params, frame)
    @frame = frame.nil? ? [nil] : frame
    @chance1 = params[:chance1].to_i if params[:chance1]
    @chance2 = params[:chance2].to_i if params[:chance2]
    @chance3 = params[:chance3].to_i if params[:chance3]
    frameNumber
  end

  def frameNumber
    @frameNumber ||= valid? ? frame.size : frame.size - 1
  end

  def calc
    @frame[frameNumber] = {spare: spare?, strike: strike?, score: calc_frame_score}
  end

  def total
    @frame.inject(0){|rez, item| item ? rez + item[:score] : rez }
  end

  def over?
    frameNumber >= FRAMES + (frameNumber == FRAMES && (strike? || spare?)  ? 1 : 0)
  end

  def strike?
    @chance1 == PINS
  end

  def spare?
    @chance1 + @chance2 == PINS
  end

  def valid?
    @valid ||= begin
      @errorMessage = ''
      if !@chance1 || !in_range(@chance1)
        @errorMessage = 'The 1st ball knocked wrong number of pins'
        return
      end
      if (!strike? && !@chance2) || !in_range(@chance2)
        @errorMessage = 'The 2nd ball knocked wrong number of pins'
        return
      end
      if !strike? && !in_range(@chance1 + @chance2)
        @errorMessage = 'The sum of knocked pins is wrong'
        
        return
      end
      true
    end
  end

  private
  def calc_frame_score
    prev_frame = frame[frameNumber - 1]
    if prev_frame && (prev_frame[:strike] || prev_frame[:spare])
      frame[frameNumber - 1][:score] = PINS + @chance1 + (prev_frame[:strike] ? @chance2 : 0)
    end
    @chance1 + @chance2
  end

  def in_range(num)
    (0..PINS) === num
  end
  
  
end
