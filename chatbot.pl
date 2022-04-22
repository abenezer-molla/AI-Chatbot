:- [kb].
:- use_module(library(random)).
:- dynamic name_of_student/1 , courses_the_student_taken_as_CSandAI_major/1, student_country_of_origin/1.

% ##########################################################################################################################


% starting a loop for a series of conversations
chat:-
	processing_welcome_messages,
	begin_series_of_conversations.


% below is given an instruction for series of conversations until the user decides to call it a day and say bye to the bot.
begin_series_of_conversations:-
	repeat, % uses backtracking
	prompt(you), 
	set_of_general_reply(A,B),
	prompt(me), 
	take_inputs_and_add_to_list(B), 
	time_to_stop_chat(A),
        print_overall_conversation_outcome, !.


% here I will handle the logic for stoping the conversation once the user says bye.
set_of_general_reply(A, B):- 
    time_to_stop_chat(A), !,
	list_of_responses(sayingBye, Result),  
	pick_random_response_from_list(Result, B). 

% below checks for greeting words to be picked up so that the bot can respond to them.
% list_of_responses is defined inside the kb.pl file- refer back and see how things map back
set_of_general_reply(A, B):- 
        checkForGreetingWord(A), !,
        list_of_responses(sayingHi, Result), 
	pick_random_response_from_list(Result, B). 


% below checks for gratitude words to be picked up so that the bot can respond to them.
set_of_general_reply(A, B):- % 
        checkForTheWord_Thanks(A), !,
        list_of_responses(responseToGratitude, Result), 
        pick_random_response_from_list(Result, B).

% the code below accepts request for botName, then the bot will choose from the list of available options inside the kb.pl file.
set_of_general_reply(A, B):- 
        askingBotName(A, _), !,  
        list_of_responses(botName, D),  
        pick_random_response_from_list(D, B).  


% the code below accepts request for botNationality, then the bot will choose from the list of available options inside the kb.pl file.
set_of_general_reply(A, B):- 
        askingBotNationality(A, _), !, 
        list_of_responses(botNationality, D), 
        pick_random_response_from_list(D, B).

% the code below accepts request for some personal questions, then the bot will choose from the list of available options inside the kb.pl file.
set_of_general_reply(A, B):- 
        askingPersonal_Q(A, _), !, 
        list_of_responses(responseToPersonalQ, D), 
        pick_random_response_from_list(D, B). 


% the code below checks for the question asked
% set_of_info_collected will be populated once the infor is collected.
% you will see how it is going to get called later in the code. 
set_of_general_reply(Inp, B):- 
        \+ check_for_question_asked(Inp), 
        \+ set_of_info_collected(_, _), !,
        collect_and_assert_information(4),
        list_of_responses(showingGratitude, D), 
        pick_random_response_from_list(D, B).



% this is the logic that handles the way the bot is going to see feedback from the user. (refer to kb.pl to see the connection)
set_of_general_reply(Inp, B):- 
        \+ check_for_question_asked(Inp), 
        \+ seeking_improvement(_, _), !,
        iterativeUserFeedback(4),  % because I have 4 feedbacks to choose and iterate from. this number changes when feedback choices in kb.pl increase.
        list_of_responses(showingGratitude, D),
        pick_random_response_from_list(D, B).

% in kb.pl i discussed about how human beings ask unrelated(and/or) distracting conversation and not follow a strict back and forth reply. 
% I want to give the bot that kind of property by letting him ask some distracting, but funny-ish, questions.
% look back into kb.pl file to see how this logic maps back to the data. 
set_of_general_reply(Inp, B):-
        \+ check_for_question_asked(Inp), !,
	list_of_responses(distractingTheUser, Result),
	pick_random_response_from_list(Result, B).


% if our item of interest is not a question we're prepared for, then we would give the random answers we have in the kb. 
% look back to kb.pl to see what those answers look like
set_of_general_reply(Inp, B):- 
        check_for_question_asked(Inp), !,
        list_of_responses(giveRandomAnswer, Result),
        pick_random_response_from_list(Result, B).


% a logic to handle the iterative feedback. 
iterativeUserFeedback(0). 
iterativeUserFeedback(Index):-
        list_of_inquiries(seeking_improvement, D),
        check_for_list_item_with_given_index(D, Index, B),
        prompt(me),
        take_inputs_and_add_to_list(B),
        prompt(you),
        assert(seeking_improvement(B, S)),
        Idx is Index - 1,
        iterativeUserFeedback(Idx).

%#######################################################################################

% A series of validation and assertion to kb will take place in the codes below.
% I made the variable name very self-explanatory for anyone to read and understand what is going on.
collect_and_assert_information(0).
collect_and_assert_information(Index):-
        list_of_inquiries(basic_info_of_student, D),
        check_for_list_item_with_given_index(D, Index, Q), 
        prompt(me),
        take_inputs_and_add_to_list(Q),
        prompt(you),
        assert(set_of_info_collected(Q, R)),
        collect_and_assert_information(Q, R),
        Idx is Index - 1,
        collect_and_assert_information(Idx).

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_stringStudent(Q, student), !, 
        retrieve_name_of_the_student(Q, RL).

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_stringStudent(Q, courses), !,
        collect_info_about_CSandAI_courses(RL).

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_stringCountry(Q, country), !,
        collect_Info_about_students_country(RL). 

collect_and_assert_information(_, _). 

% #####################################################################
% the codes below are to retrieve and validate the student's name and other info.
retrieve_name_of_the_student(Q):-
        prompt(you),
        retrieve_name_of_the_student(Q, Inp).

retrieve_name_of_the_student(_, RL):-
        check_if_name_exists(RL), !.

retrieve_name_of_the_student(Q, _):-
        list_of_responses(requestingName, D), 
        pick_random_response_from_list(D, X), 
        prompt(me),
        take_inputs_and_add_to_list(X),
        retrieve_name_of_the_student(Q).

check_if_name_exists(NL):-
        check_for_list_item_with_given_index(NL, 1, N),
        student(N),
        assert(name_of_student(N)).

% ###########################################################################
% the codes below are to retrieve and validate the student's courses taken and other info.
collect_info_about_CSandAI_courses:-
	prompt(you),
	collect_info_about_CSandAI_courses(Inp).
collect_info_about_CSandAI_courses(Inp):- 
	check_if_CSandAI_course_exists(Inp), !.
collect_info_about_CSandAI_courses(_):- 
        list_of_responses(responseToInputCourses, D),
        pick_random_response_from_list(D, R),
        prompt(me),
        take_inputs_and_add_to_list(R), 
        collect_info_about_CSandAI_courses.


check_if_CSandAI_course_exists(Inp):- 
        required_cs_courses_to_graduate_as_CS_and_AI_concentration(D),
        checking_intersection_between_two_subsets(Inp, D, A),
        A \== [],
        assert(courses_the_student_taken_as_CSandAI_major(A)).


%   ########################################################################
% the codes below are to retrieve and validate the student's country of origin and other info.
collect_Info_about_students_country:-
	prompt(you),
	collect_Info_about_students_country(Inp).
collect_Info_about_students_country(Inp):- 
	check_if_country_exists(Inp), !.
collect_Info_about_students_country(_):- 
        list_of_responses(responseToInputCountry, D),
        pick_random_response_from_list(D, R),
        prompt(me),
        take_inputs_and_add_to_list(R), 
        collect_Info_about_students_country.


check_if_country_exists(Inp):- 
        list_of_available_world_countries(D),
        checking_intersection_between_two_subsets(Inp, D, A),
        A \== [],
        assert(student_country_of_origin(A)).

check_if_country_exists

%   ####################################################

%checking for greeting words
checkForGreetingWord(Inp):-
        list_of_greetings(D),
        checking_intersection_between_two_subsets(Inp, D, A), 
        A \== [].

%   ####################################################
% serves are a validation tool for the questions asked. If the question is something the bot can't adress, then it will go to the random set of answers discribed in kb.pl and above.
check_for_question_asked(Inp):-
        items_of_interest('?', Inp).

%   ####################################################
% going over the different forms of gratitudes to look for a match/intersection
checkForTheWord_Thanks(Inp):-
        list_of_gratitudes(D),
        checking_intersection_between_two_subsets(Inp, D, A),
        A \== [].

%   ####################################################
% when the user says bye, the bot will call it a day too.
time_to_stop_chat(Inp):- 
        check_if_subset_exists([bye], Inp).


%   ####################################################
processing_welcome_messages:-
        set_of_general_reply(sayingHi, D),
        pick_random_response_from_list(D, W),
        prompt(me),
        take_inputs_and_add_to_list(W), 
        flush_output. 


prompt(me):-
botWritingSpace(X), write(X), write(': '), flush_output.
prompt(you):-
userWritingSpace(X), write(X), write(': '), flush_output.
botWritingSpace('botAben').
userWritingSpace('Human').

%   ####################################################
pick_random_response_from_list(Result, B):- 
        length(Result, Char),  
        Char is Char + 1,
        random(1, Char, RandomVal),
        check_for_list_item_with_given_index(Result, RandomVal, B).


%   ####################################################
print_overall_conversation_outcome:-
    write('\n--- summary of the conversation with important student details ---\n'),
    name_of_student(X), student_country_of_origin(Y), courses_the_student_taken_as_CSandAI_major(Z), 
        take_inputs_and_add_to_list(['Name of Student: ', X, '\nCountry of Origin: ', Y, '\n CS & AI Course/Courses taken: ', Z]),
        retract(name_of_student(X)),retract(student_country_of_origin(Y)), retract(courses_the_student_taken_as_CSandAI_major(Z)), fail.
print_overall_conversation_outcome:-
    nl, seeking_improvement(X, Y), write(X), write(' : '), take_inputs_and_add_to_list(Y), 
    retract(seeking_improvement(X, Y)), fail.
print_overall_conversation_outcome:-
    nl, set_of_info_collected(X, Y), write(X), write(' : '), take_inputs_and_add_to_list(Y), 
    retract(set_of_info_collected(X, Y)), fail.
print_overall_conversation_outcome.




