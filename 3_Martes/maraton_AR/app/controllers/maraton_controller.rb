class MaratonController
  def initialize(args)
    @view = View.new
    options(@view.welcome)  
  end

  def options(option)
    option = option.to_i
    #variable para saber si se encontro correo y password
    user = ""
    m = 0
    deck = "" 
    case option
      when 1
        users = User.all
        email_password = []
        while m!=1
          email_password=@view.login
          users.each do |object|
            if object.email == email_password[0] && object.password == email_password[1]
              user=object
              p user
              deck = @view.maraton
              deck=deck.to_i
              m=1
            end
          end
          if m != 1
            p "no se encotro correo y/o contraeña, intente de nuevo"
          end
        end
        #aqui guardaremos las respeustas del usuario
        user_answers = []
        option = []
        #para poder guardar las id de las pregntas que se usaran en el alta de Statatics
        questions_id=[]
        #guardamos las preguntas del deck seleccionado
        questions = Question.where(:deck_id => deck)
        
        questions.each do |question|
          #las respuestas de cada pregunta
          questions_id << question.id
          answers_per_question = Answer.where(:question_id => question.id)
            user_answers << @view.new_turn(question, answers_per_question)
        end
        #Ya que tenemos todas las respuestas del usuario, debemos darle su resultado
        correct = 0
        wrong = 0
        user_answers.each do |i|
          if i[0].status
            correct+=1
          else
            wrong+=1
          end
        end
        @view.score(correct, wrong)
        game = Game.create(user_id: user.id, deck_id: deck, correct: correct, incorrect: wrong)
        answers=[]
        user_answers.each do |i|
          answers << i[0].id
        end
          
        (0..answers.length - 1).each do |i|
         Statistic.create(game_id: game.id, question_id: questions_id[i], answer_id: answers[i])
        end

      when 2
        #arreglo que contendra el nombre, correo y ccontraseña
        nep=[]
        nep = @view.create
        users = User.all
        users.each do |user|
          if user.email == nep[1]
            @view.error_correo
            options("2")
            exit
          end
        end
        User.create(name: nep[0], email: nep[1], password: nep[2])
        @view.gracias
      when 3
        games1 = Game.all
        games=games1.order(correct: :desc)
        @view.scores(games)
      else
        puts "Nothing to do here"
        exit
    end
  end

end