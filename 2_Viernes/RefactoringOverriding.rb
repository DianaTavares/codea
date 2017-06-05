# Refactoriza usando overriding o super y agrega el código necesario para que las pruebas sean true. Las pruebas no deben modificarse.

class SuperSay
  def say(text)
    text
  end

end

class HtmlSay < SuperSay
  def say(text)
    "<p>" + super + "</p>"
  end

end

class CssSay < SuperSay
end

doc=HtmlSay.new
style=CssSay.new

#test
p doc.say("You've refactored") == "<p>You've refactored</p>"
p style.say("I like to code") == "I like to code"