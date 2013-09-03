module BowlingHelper
  
  def input(name, label, value = 0)
    content_tag(:div, id: "block-#{name}", class: 'input-block') do
      content = label_tag name, "#{label}: "
      content += text_field_tag name, value, {size: 3, maxlength: 2}
    end
  end
  
  def scores
    scores = ''
    @bowling.frame.each{|frame| scores += "<td>#{frame[:score]}</td>" if frame}
    scores
  end

  def titles
    header = ''
    (1..@bowling.frameNumber).each{|frame| header += "<td>##{frame}</td>"}
    header
  end
  
end
