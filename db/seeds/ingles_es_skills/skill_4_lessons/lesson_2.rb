course = Course.find_by_name("Inglés")
skill = Skill.find_by(name: "Greetings", course_id: course.id)

lesson = Lesson.create!(
  name: "Lesson 2",
  skill_id: skill.id
)

  mcq1 = Exercise.create!(
    lesson_id: lesson.id,
    thing_to_translate: "Hasta la vista",
    exercise_type: "multiple_choice"
  )

  choice_1_1 = AnswerChoice.create!(
    body: "Goodbye",
    exercise_id: mcq1.id,
    is_correct: true

  )
  choice_1_3 = AnswerChoice.create!(
    body: "Good day",
    exercise_id: mcq1.id
  )
  choice_1_4 = AnswerChoice.create!(
    body: "What's up?",
    exercise_id: mcq1.id
  )


  mcq2 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "Hasta luego"
  )
  choice_2_1 = AnswerChoice.create!(
    body: "See you later",
    exercise_id: mcq2.id,
    is_correct: true,
  )
  choice_2_2 = AnswerChoice.create!(
    body: "Good morn",
    exercise_id: mcq2.id
  )
  choice_2_3 = AnswerChoice.create!(
    body: "How are you?",
    exercise_id: mcq2.id
  )


  mcq3 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "Hasta pronto"
  )
  choice_3_1 = AnswerChoice.create!(
    body: "See you soon",
    is_correct: true,
    exercise_id: mcq3.id,
  )
  choice_3_2 = AnswerChoice.create!(
    body: "Hello",
    exercise_id: mcq3.id
  )

  choice_3_4 = AnswerChoice.create!(
    body: "See you in five minutes",
    exercise_id: mcq3.id
  )


  mcq4 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "See you later"
  )
  choice_4_2 = AnswerChoice.create!(
    body: "Hasta luego",
    is_correct: true,
    exercise_id: mcq4.id
  )
  choice_4_3 = AnswerChoice.create!(
    body: "Hasta mañana",
    exercise_id: mcq4.id
  )
  choice_4_4 = AnswerChoice.create!(
    body: "Hasta el fin del mundo",
    exercise_id: mcq4.id
  )

  mcq5 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "Hasta mañana"
  )

  choice_5_1 = AnswerChoice.create!(
    exercise_id: mcq5.id,
    body: "See you tomorrow",
    is_correct: true,
  )

  choice_5_3 = AnswerChoice.create!(
    body: "Hey there",
    exercise_id: mcq5.id
  )
  choice_5_4 = AnswerChoice.create!(
    body: "Take care",
    exercise_id: mcq5.id
  )

  mcq6 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "Hasta la próxima vez"
  )

  choice_6_1 = AnswerChoice.create!(
    body: "Until next we meet",
    is_correct: true,
    exercise_id: mcq6.id,
  )
  choice_6_3 = AnswerChoice.create!(
    body: "Until next we eat",
    exercise_id: mcq6.id
  )
  choice_6_4 = AnswerChoice.create!(
    body: "Have a good day",
    exercise_id: mcq6.id
  )

  mcq7 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "Cuídate"
  )

  choice_7_1 = AnswerChoice.create!(
    body: "Take care",
    is_correct: true,
    exercise_id: mcq7.id,
  )
  choice_7_2 = AnswerChoice.create!(
    body: "Bye",
    exercise_id: mcq7.id
  )
  choice_7_3 = AnswerChoice.create!(
    body: "What's up?",
    exercise_id: mcq7.id
  )


  mcq8 = Exercise.create!(
    lesson_id: lesson.id,
    exercise_type: "multiple_choice",
    thing_to_translate: "¿Qué tal?"
  )

  choice_8_1= AnswerChoice.create!(
    body: "What's up?",
    is_correct: true,
    exercise_id: mcq8.id,
  )
  choice_8_3 = AnswerChoice.create!(
    body: "Who are you?",
    exercise_id: mcq8.id
  )
  choice_8_4 = AnswerChoice.create!(
    body: "Get away from me",
    exercise_id: mcq8.id
  )