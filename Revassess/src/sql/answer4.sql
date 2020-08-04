SELECT username, name, question, answer FROM (SELECT username, user_id FROM app_user WHERE user_id = 5),
(SELECT owner_id as ownerid, name, question, answer FROM
(SELECT owner_id, flashcard_id AS studyset FROM 
study_set_card,study_set WHERE study_set.study_set_id = study_set_card.study_set_id),
(SELECT flashcard_id AS flashcard, category.name,question,answer FROM flashcard,category WHERE flashcard.category_id = category.category_id) WHERE flashcard = studyset)
WHERE user_id = ownerid;