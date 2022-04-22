

list_of_responses(sayingHi, [
    ['Hello!'], 
    ['Hi!'], 
    ['What is up'], 
    ['Morning'],
    ['Good Morning'],
    ['Afternoon'],
    ['What is Good!'],
    ['Good afternoon!'],
    ['Hi, dear'],
    ['Hello, sir'],
    ['Hello, maam'],
    ['Good evening']

    ]).

list_of_greetings([
    hey, 
    yo, 
    hello,
    hi,
    hola
    ]).

list_of_responses(sayingBye, [
    ['Bye!'], 
    ['See you!'], 
    ['Ciao!'], 
    ['Later!'], 
    ['Talk later!']
    ]).

list_of_responses(change_topic, [
    ['Do you mind if I ask you some questions?']
    ]).


GETBACKHERE- LOCATION
list_of_responses(location, [
    ['From which country are you traveling from'],
    ['Are you a diplomat or government employee'],
    ['Where are you?']
    ]).



list_of_responses(responseToInputCourses, [
    ['Haven\'t heard of that one before!'],
    ['That\'s not a real subject...'],
    ['Are you sure?'],
    ['Hold on, I need to know about your A-levels!'],
    ['Don\'t you want to tell me your A-levels?']
    ]).

list_of_responses(requestingName, [
    ['You are joking. Is that your name.'],
    ['You are funny. But for real, tell me your name.'],
    ['I am not trying to be rude, but that sounds like a fake name.'],
    ['I am so stubborn. I have to know your name.'],
    ['Come on, do not kill the fun. Just tell me your name.']
    ]).
        
list_of_responses(botName, [
    ['I am Aben. How can I help you?'],
    ['Aben, sir/maam'],
    ['You\'r talking to Aben'],
    ['Aben- ready for service'],
    ['Aben here- what is up?']
    ]).

list_of_responses(botNationality, [
    ['I\'m Ethiopian!'],
    ['I am from Ethiopia'],
    ['Born and raised in Ethiopia'],
    ['Pround Ethiopian'],
    ['Ethiopian it is'],
    ['I prefer not to talk about it']
    ]).

list_of_responses(showingGratitude, [
    ['Thanks a lot, Aben!'],
    ['Bro, that was dope!'],
    ['Thanks mate!'],
    ['Appreciated Brother!'],
    ['You are a good one. Thanks!'],
    ['Bless up my guy!'],
    ['cool cool!']
    ]).

list_of_gratitudes([
    thanks,
    thankyou,
    thank,
    cheers
    ]).

list_of_responses(responseToGratitude, [
    ['Anytime!'],
    ['Anything for you.'],
    ['It is my pleasure.'],
    ['Cheers.'],
    ['No worries at all.']
    ]).

list_of_responses(responseToPersonalQ, [
    ['All good, thanks for asking.'],
    ['Life is good!'],
    ['It could have been worse. '],
    ['Thank God'],
    ['I am doing great!']
    ]).

list_of_responses(distractingTheUser, [
    ['You look nice today'],
    ['So, what is your favorite food btw?'],
    ['What do you think about Minerva so far'],
    ['I almost forgot, how is your family doing?'],
    ['Why do I feel like we know each other somewhere?'],
    ['You are kinda smart, I give you that.'],
    ['How rude of me to wait this long to tell you how awesome you are'],
    ['Who is your favorite Spiderman btw?'],
    ['Tell me you are cool without telling me you are cool'],
    ['Damnnnnnnnnnnn!'],
    ['You said your major was?'],
    ['Wait up, so you love Jazz? Or am I tripping?'],
    ['Pardon?']
    ]).

list_of_responses(giveRandomAnswer, [
    ['I have no idea'],
    ['Damn, that a tough one. Sorry'],
    ['I will pass'],
    ['Do you mind throwing in a different question.'],
    ['This is a bit outside of my scope. You might ask my twin brother Abenezer.'],
    ['Broooo, even Einstein will not give you an answer for this.'],
    ['pardon?'],
    ['My brain is a bit rusty now! Maybe later!']
    ]).


%################################################################

list_of_inquiries(seeking_improvement, [
    ['Tell me I was awesome.'],
    ['How was your over all experiance?'],
    ['On the scale of 1 to 10, how would you rate my performance?'],
    ['On the scale of 5 stars, what will you give me?']
    ]).

list_of_inquiries(basic_info_of_student, [
    ['What is your name buddy?'],
    ['And you said you are from Minerva?'],
    ['So how long has it been since you started?'],
    ['When is your expected year of graduation?'],
    ['Where are you from originally?']
    ]).




required_cs_courses_to_graduate_as_CS_and_AI_concentration(
    [cs110,
    cs142,
    cs152,
    cs162,
    cs112,
    cs111A,
    cs152,
    il91,
    il92,
    il93,
    il94,
    il95,
    il96,
    il97,
    il98,
    cp191,
    cp192,
    cp193,
    cp194,
    ah50,
    ah51,
    cs50,
    cs51,
    ns50,
    ns51,
    ss50,
    ss51,
    il199
    ]).

% ####################################################################
% names of students from CS152 class

student('Nahom').
student('Adaobi').
student('Evgenia').
student('Parker').
student('Fellipe').
student('Aniket').
student('Oyunbileg').
student('Kalyane').
student('Eisha').
student('Ingrid').
student('Nikita').
student('Chretien').
student('Corin').
student('Chad').
student('Abenezer').
student('Zeineb').
student('Jeongwoo').
student('Junran').
student('Endrit').
student('Nazar').

% ####################################################################


% Matches questions about the chatbot's subjects.
askingBotNationality([which, country, are, you, representing, X |_], X):-!.
askingBotNationality([which country , are, you, from, X |_], X):-!.
askingBotNationality([what, is, your, nationality, X |_], X):-!.
askingBotNationality([where, were, you, born, and, raised, X |_], X):-!.
askingBotNationality([where, was, your, passport, issues, X |_], X):-!.

askingBotNationality([_|T], X):-
    askingBotNationality(T, X).

% ####################################################################

% Matches questions about the chatbot's name.

askingBotName([what, is, your, name, X |_], X):-!.
askingBotName(['what\'s', your, name, X |_], X):-!.
askingBotName([your, name, X |_], X):-!.
askingBotName([I 'did\'nt', get, your, name, X |_], X):-!.
askingBotName([I, did, not, get, your, name, X |_], X):-!.
askingBotName([name, please, , X |_], X):-!.
askingBotName([_|T], X):-
    askingBotName(T, X).

% Matches questions about how the chatbot is feeling.
askingPersonal_Q([how, you, doing, X |_], X):-!.
askingPersonal_Q([how, is, life, X |_], X):-!.
askingPersonal_Q([is, everything, okay, X |_], X):-!.
askingPersonal_Q([what, is, up, with, you, X |_], X):-!.
askingPersonal_Q([_|T], X):-
    askingPersonal_Q(T, X).


% ####################################################################

% Checks to see if SubSet is an intersection of Set1 and Set2.
checking_intersection_between_two_subsets([], _, []).
checking_intersection_between_two_subsets([H|T1], L2, [H|T3]):- 
        items_of_interest(H, L2), !,
        checking_intersection_between_two_subsets(T1, L2, T3).
checking_intersection_between_two_subsets([_|T1], L2, L3):-
        checking_intersection_between_two_subsets(T1, L2, L3).

% write_list(List)
%
% Prints a list without brackets and without separating commas.
take_inputs_and_add_to_list([]):- nl.
take_inputs_and_add_to_list([H|T]):- write(H), write(' '), take_inputs_and_add_to_list(T).

% subset(SubSet, Set)
%
% True if SubSet is indeed a subset of Set.
check_if_subset_exists([], _).
check_if_subset_exists([H|T], L2):- 
        items_of_interest(H, L2),
        check_if_subset_exists(T, L2).

% nth_item(List, N, Item)
%
% Holds true if the N-th item in the List is Item.
check_for_list_item_with_given_index([H|_], 1, H).
check_for_list_item_with_given_index([_|T], N, X):-
        check_for_list_item_with_given_index(T, N1, X),
        N is N1 + 1.

% contains(String, SubString)
%
% True if the substring exists in String.
check_for_substring_in_string(A, B) :-
  atom(A),
  atom(B),
  student(A, AA),
  student(B, BB),
  check_for_substring_in_string(AA, BB).
check_for_substring_in_string(A, B) :-
  atom(A),
  student(A, AA),
  check_for_substring_in_string(AA, B).
check_for_substring_in_string(A, B) :-
  sublist(B, A),
  B \= [].

sublist(S, L) :-
  append(_, L2, L),
  append(S, _, L2).