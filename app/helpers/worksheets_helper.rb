module WorksheetsHelper

  def calculate_antifragility_score(worksheet)
    antifragility_score = 0
    
    # boring, bad code, don't want to think too hard
    if worksheet.elephant1
    
      if worksheet.elephant1 < 3
        antifragility_score = antifragility_score - 2
      elsif worksheet.elephant1 > 2 && worksheet.elephant1 < 6
        antifragility_score = antifragility_score - 1
      elsif worksheet.elephant1 > 5 && worksheet.elephant1 < 9  
        antifragility_score = antifragility_score + 1
      elsif worksheet.elephant1 > 8
        antifragility_score = antifragility_score + 2
      end
    
    end
    
    
    if worksheet.elephant2
      if worksheet.elephant2 < 3
        antifragility_score = antifragility_score - 2
      elsif worksheet.elephant2 > 2 && worksheet.elephant1 < 6
        antifragility_score = antifragility_score - 1
      elsif worksheet.elephant2 > 5 && worksheet.elephant1 < 9  
        antifragility_score = antifragility_score + 1
      elsif worksheet.elephant2 > 8
        antifragility_score = antifragility_score + 2
      end
    end
    

    if worksheet.antifragile
      if worksheet.antifragile < 3
        antifragility_score = antifragility_score - 2
      elsif worksheet.antifragile > 2 && worksheet.elephant1 < 6
        antifragility_score = antifragility_score - 1
      elsif worksheet.antifragile > 5 && worksheet.elephant1 < 9  
        antifragility_score = antifragility_score + 1
      elsif worksheet.antifragile > 8
        antifragility_score = antifragility_score + 2
      end
    end
    
    if worksheet.responsible1
      
      if worksheet.responsible1 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end
    
      if worksheet.responsible2 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end   
    end 
    
    
    if worksheet.independent1
      if worksheet.independent1 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end    
    
      if worksheet.independent2 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end    
    end  
    
    if worksheet.develop1
      if worksheet.develop1 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end    
    
      if worksheet.develop2 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end   
    end  
    
    if worksheet.reflection1
      if worksheet.reflection1 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end  
    end     
    
    if worksheet.reflection2
      if worksheet.reflection2 == "true"
        antifragility_score = antifragility_score + 1
      else
        antifragility_score = antifragility_score - 1
      end   
    end
    
    return antifragility_score 
    
  end
  

end
