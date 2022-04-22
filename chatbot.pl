:- [kb].
:- use_module(library(random)).
:- dynamic name_of_student/1 , courses_the_student_taken_as_CSandAI_major/1. #GETBACK TO THIS

% ####################################################################
% Matches where-is, how-do-i-find patterns.


% chat/0
%
% top level call, starts conversation loop
chat:-
	processing_welcome_messages,
	conversations.

% conversations/0
%
% Main chatbot backtracking loop. Repeats until user enters "bye".
conversations:-
	repeat, % repeat through backtracking 
	prompt(you), % Marked
	set_of_general_reply(A,B), % Marked
	prompt(me), % Marked
	take_inputs_and_add_to_list(B), % Marked GETBACK
	time_to_quit_chat(A),  % Marked
        print_overall_conversation_outcome, !. % Marked

% gen_reply/2
%
% Generates a response based on what the user typed in.

set_of_general_reply(A, B):- % check for "bye"
    time_to_quit_chat(A), !, % Marked
	list_of_responses(sayingBye, Result),  % Marked
	pick_random_response_from_list(Res, B). % Marked


set_of_general_reply(A, B):- % check for greeting
    checkForGreetingWord(A), !,
	list_of_responses(sayingHi, Result),  % Marked
	pick_random_response_from_list(Result, B). % Marked


set_of_general_reply(A, B):- % check for thanks
    checkForTheWord_Thanks(A), !,
    list_of_responses(responseToGratitude, Result),  % Marked
    pick_random_response_from_list(Result, B).  % Marked


set_of_general_reply(A, B):- % asking my name (simple)?
    askingBotName(A, _), !,  % Marked
    list_of_responses(botName, D),  % Marked
    pick_random_response_from_list(D, B).  % Marked


set_of_general_reply(A, R):- % asking my subjects?
    askingBotNationality(A, _), !, % Marked
    list_of_responses(botNationality, D), % Marked
    pick_random_response_from_list(D, B).


set_of_general_reply(A, B):- % asking how I am (simple)?
    askingPersonal_Q(A, _), !, % Marked
    list_of_responses(responseToPersonalQ, D), % Marked
    pick_random_response_from_list(D, B). % Marked


set_of_general_reply(Inp, B):- % get information
        \+ check_for_question_asked(Inp), % Marked
        \+ set_of_info_collected(_, _), !,
        collect_and_assert_information(4), % GET BACK LATER
        list_of_responses(showingGratitude, D), % Marked
        pick_random_response_from_list(D, B). % Marked


set_of_general_reply(Inp, B):- % get feedback
        \+ check_for_question_asked(Inp), 
        \+ seeking_improvement(_, _), !,
        iterativeUserFeedback(4), % GET BACK LATER
        list_of_responses(showingGratitude, D),
        pick_random_response_from_list(D, B).

set_of_general_reply(Inp, B):- % ask a random question
        \+ check_for_question_asked(Inp), !,
	list_of_responses(random_question, Result),
	pick_random_response_from_list(Res, B).

set_of_general_reply(Inp, B):- % give a random answer
        check_for_question_asked(Inp), !,
        list_of_responses(giveRandomAnswer, Result),
        pick_random_response_from_list(Res, B).


%   ####################################################
iterativeUserFeedback(0). % GETBACK 
iterativeUserFeedback(N):-
        list_of_inquiries(seeking_improvement, D),
        check_for_list_item_with_given_index(D, N, R),
        prompt(me),
        take_inputs_and_add_to_list(R),
        prompt(you),
        assert(seeking_improvement(R, S)),
        M is N - 1,
        iterativeUserFeedback(M).

% and asserts the responses into the database.
collect_and_assert_information(0).
collect_and_assert_information(N):-
        list_of_inquiries(basic_info_of_student, D),
        check_for_list_item_with_given_index(D, N, Q), % GETBACK
        prompt(me),
        take_inputs_and_add_to_list(Q),
        prompt(you),
        assert(set_of_info_collected(Q, R)),
        collect_and_assert_information(Q, R),
        M is N - 1,
        collect_and_assert_information(M).

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_string(Q, student), !,
        retrieve_name_of_the_student(Q, RL).

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_string(Q, subjects), !,
        collect_info_about_CSandAI_courses(RL). % GET INFO

collect_and_assert_information(QL, RL):-
        check_for_list_item_with_given_index(QL, 1, Q),
        check_for_substring_in_string(Q, from), !,
        assert(usr_location(RL)).

collect_and_assert_information(_, _).

% get_usr_name/1
% 
% Prompts the user to input a valid name, and asserts it.


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

% is_valid_name/1
%
% Checks if the given list contains a name that is valid.
check_if_name_exists(NL):-
        check_for_list_item_with_given_index(NL, 1, N),
        student(N),
        assert(name_of_student(N)).

% get_alevel_info_loop/0
%
% When called, will prompt the user for a list of valid
% a-levels.
collect_info_about_CSandAI_courses:-
	prompt(you),
	collect_info_about_CSandAI_courses(Inp).
collect_info_about_CSandAI_courses(Inp):- 
	check_if_CSandAI_course_exists(Inp), !.
collect_info_about_CSandAI_courses(_):- 
        list_of_responses(responseToInputCourses, D),
        pick_random_response_from_list(D, R),
        prompt(me),
        take_inputs_and_add_to_list(R), % GET BACK
        collect_info_about_CSandAI_courses.

% is_valid_alevel/1
%
% Checks to see if the given list contains valid alevels,
% and if so, asserts them.
check_if_CSandAI_course_exists(Inp):- 
        required_cs_courses_to_graduate_as_CS_and_AI_concentration(D),
        checking_intersection_between_two_subsets(Inp, D, A),
        A \== [],
        assert(courses_the_student_taken_as_CSandAI_major(A)).

%   ####################################################

% is_greeting(Sentence)
% 
% True if the sentence matches any greetings in the database.

checkForGreetingWord(Inp):-
        list_of_greetings(D),
        checking_intersection_between_two_subsets(Inp, D, A), %  GET BACK
        A \== [].

% is_question/1
%
% Checks if the given sentence S matches any "question" type
% sentences in the database.
check_for_question_asked(Inp):-
        items_of_interest('?', Inp).

% is_thanks/1
%
% Checks if the given sentence S matches any "thanks" type
% sentences in the database.
checkForTheWord_Thanks(Inp):-
        list_of_gratitudes(D),
        checking_intersection_between_two_subsets(Inp, D, A),
        A \== [].



%
% Checks if the given sentence S contains the word "bye".
time_to_quit_chat(Inp):- 
        check_if_subset_exists([bye], Inp).


% #####################################
% subset(SubSet, Set)
%



% print_welcome/0
%
% Outputs a random greeting message.
processing_welcome_messages:-
    responses_db(sayingHi, D),
    pick_random_response_from_list(D, W),
    prompt(me),
    record_response(W), 
    flush_output. 


prompt(me):-
botWritingSpace(X), write(X), write(': '), flush_output.
prompt(you):-
userWritingSpace(X), write(X), write(': '), flush_output.
botWritingSpace('botAben').
userWritingSpace('Human').

% random_pick/2
%
% Picks a random response (Res) from a list (R).
pick_random_response_from_list(Result, B):- 
    length(Result, Char),  
    Char is Char + 1,
    random(1, Char, RandomVal),
    check_for_list_item_with_given_index(Result, RandomVal, B).


% print_report/0
%
% Outputs a conversation summary based on facts gathered 
% during chat.
print_overall_conversation_outcome:-
    write('\n--- Conversation report ---\n'),
    name_of_student(X), usr_location(Y), courses_the_student_taken_as_CSandAI_major(Z), 
        take_inputs_and_add_to_list(['User name: ', X, '\nFrom: ', Y, '\nStudying: ', Z]),
        retract(name_of_student(X)),retract(usr_location(Y)), retract(courses_the_student_taken_as_CSandAI_major(Z)), fail.
print_overall_conversation_outcome:-
    nl, seeking_improvement(X, Y), write(X), write(' : '), take_inputs_and_add_to_list(Y), 
    retract(seeking_improvement(X, Y)), fail.
print_overall_conversation_outcome:-
    nl, set_of_info_collected(X, Y), write(X), write(' : '), take_inputs_and_add_to_list(Y), 
    retract(set_of_info_collected(X, Y)), fail.
print_overall_conversation_outcome.




