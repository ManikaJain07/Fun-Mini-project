CREATE TABLE relatives_questions(
    question_id SERIAL PRIMARY KEY, --Unique question ID
    question VARCHAR(255) NOT NULL,
    asked_by VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    frequency INT NOT NULL,
    pressure_level INT NOT NULL,
    what_i_wanted_to_say VARCHAR(255) NOT NULL,
    what_i_said_irl VARCHAR(255) NOT NULL
);

INSERT INTO relatives_questions(
    question,asked_by,category,frequency,pressure_level,what_i_wanted_to_say,what_i_said_irl)
    VALUES(
        'Beta, what are you planning to do after college?',
        'Aunt',
        'Career',
        3,
        4,
        'I am working on something. I would rather announce results than discuss plans.',
        'Let us see where life takes me'
        ),

        ('Are you preparing for government jobs?',
        'Uncle',
        'Career',
        2,
        3,
        'None of your business.',
        'My options are still under SELECTion.'
        ),

        ('What is your CGPA?',
        'Cousin',
        'Academics',
        1,
        2,
        '(─.─||)',
        'Good enough!'
        ),

        ('Which course are you pursuing?',
        'Aunt',
        'Education',
        3,
        2,
        '(─.─||) Pls get me out of here (╥﹏╥)',
        'BBA in Data Science & AI'
        ),

        ('Have you decided what you want to become?',
        'Uncle',
        'Future Goals',
        4,
        5,
        'uhh why are you so nosy',
        'Ofcourse!'
        );

        SELECT * FROM relatives_questions;

--COUNTS THE TOTAL NUMBER OF QUESTIONS I WAS ASKED        
SELECT COUNT(*)
FROM relatives_questions;

--ALL QUESTIONS THAT WERE RELATED TO MY CAREER
SELECT question, asked_by
FROM relatives_questions
WHERE category = 'Career';

--Average of pressure level I felt
SELECT AVG(pressure_level)
FROM relatives_questions;

--Number questions from each category
SELECT category, COUNT(*) AS
total_questions
FROM relatives_questions
GROUP BY category;

--Questions that created the highest pressure
SELECT question,
pressure_level
FROM relatives_questions
ORDER BY pressure_level DESC;

--comparing my inner monologue with what i actually said
SELECT question, 
what_i_wanted_to_say AS inner_voice,
what_i_said_irl AS diplomatic_response
FROM relatives_questions;

--AVERAGE PRESSURE BY CATEGORY
SELECT category, AVG(pressure_level)
FROM relatives_questions
GROUP BY category;


--MOST FREQUENTLY ASKED QUESTIONS
SELECT question, frequency
FROM relatives_questions
GROUP BY question, frequency
ORDER BY frequency DESC;

--MOST INTRUSIVE QUESTIONS WERE ABOUT MY FUTURE PLANS

-- HOW MANY TIMES DID MY NOSY AUNT ASK QUESTIONS?🙄
SELECT SUM(frequency) AS total_times
FROM relatives_questions
WHERE asked_by = 'Aunt';

-- HOW MANY TIMES DID MY NOSY UNCLES ASK QUESTIONS?🙄
SELECT SUM(frequency) AS total_times
FROM relatives_questions
WHERE asked_by = 'Uncle';

--both uncle and aunt asked questions 6 times 😮‍💨



