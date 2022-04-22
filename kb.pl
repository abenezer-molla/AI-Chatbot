
% list of values that contain the possible responses when the user is seding his/her greeting. 
% the possible types of greetings are alos different from people to people, so I just listed a few under "list_of_greetings" 
% one of the responses will be randomly picked up by the bot as a response. Makes it more fun than just giving one answer everytime.
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

% this is the list_of_greetings I have mentioned above. It contains the possible ways people might greet to the bot.
list_of_greetings([
    hey, 
    yo, 
    hello,
    hi,
    hola
    ]).

% below, I have mentioned some of the ways the bot can respond when the user is saying bye. 
list_of_responses(sayingBye, [
    ['Bye!'], 
    ['See you!'], 
    ['Ciao!'], 
    ['Later!'], 
    ['Talk later!']
    ]).

% here I have included the possible lists of responses when the user inputs a course that doesn't match the one we have in store. 
% the logic of checking if the item exists or not is inside the chatbot.pl, so you can easily map back and see what I did.

list_of_responses(responseToInputCourses, [
    ['I guess, you migth have made a mistake. Check again.'],
    ['I do not know that subject for Cs and AI majors. Maybe try again will small letters only.'],
    ['I blieve that is not one of the CS and AI requirements.'],
    ['Maybe you are inserting couses from electives. Please stay in College of Computational Sciences only.'],
    ['I would appreciate it very much if you provide me a proper answer']
    ]).

% here I have mentioned the required CS courses that one need to take as a CS and AI concentration - this excludes electives as electives might vary. 
% what I mean is that if we include elective, we will have to include anything but not CS, and that defeats the purpose of the term "required." - because it implies that almost every course outside of CS college is also required.
% so, I am going to stick with courses from CS. 
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


% Here I have included the possible set of responses for the bot to choose from when the country provided by the user doesn't match the world counries we have in our database.

list_of_responses(responseToInputCountry, [
    ['I guess, you migth have made a mistake. Check again.'],
    ['I do not think that country is real. Check again.'],
    ['Maybe, you have told me about your city. Try country.'],
    ['It is a good idea to check the spelling. I am unaware of that country.'],
    ['It is a good idea to write the name of your country with small letter.'],
    ['I would appreciate it very much if you provide me a proper answer.']
    ]).

% list of world counries I got from https://www.worldometers.info/geography/alphabetical-list-of-countries/
list_of_available_world_countries(
    [afghanistan,
    albania,
    algeria,
    andorra,
    antigua and aarbuda,
    argentina,
    armenia,
    australia,
    austria	,
    azerbaijan,
    bahamas,
    bahrain,
    bangladesh,
    barbados,
    belarus,
    belgium,
    belize,
    benin,
    bhutan,
    bolivia,
    bosnia and herzegovina,
    botswana,
    brazil,
    brunei,
    bulgaria,
    burkina faso,
    burundi,
    côte deIvoire, 
    cabo verde, 
    cambodia, 
    cameroon,
    canada, 
    central african republic, 
    chad, 
    chile, 
    china,
    colombia, 
    comoros, 
    congo, 
    costa rica, 
    croatia, 
    cuba, 
    cyprus, 
    czechia, 
    democratic republic of the congo, 
    denmark, 
    djibouti, 
    dominica, 
    dominican republic, 
    ecuador, 
    egypt, 
    el salvador, 
    equatorial guinea, 
    eritrea, 
    estonia, 
    eswatini, 
    ethiopia, 
    fiji, 
    finland, 
    france, 
    gabon, 
    gambia, 
    georgia, 
    germany, 
    ghana, 
    greece, 
    grenada, 
    guatemala, 
    guinea, 
    guinea-bissau, 
    guyana, 
    haiti, 
    holy see, 
    honduras, 
    hungary, 
    iceland, 
    india, 
    indonesia, 
    iran, 
    iraq, 
    ireland, 
    israel, 
    italy, 
    jamaica, 
    japan, 
    jordan, 
    kazakhstan, 
    kenya, 
    kiribati, 
    kuwait, 
    kyrgyzstan, 
    laos, 
    latvia, 
    lebanon, 
    lesotho, 
    liberia, 
    libya, 
    liechtenstein, 
    lithuania, 
    luxembourg, 
    malawi, 
    malaysia, 
    maldives, 
    mali, 
    malta, 
    marshall islands, 
    mauritania, 
    mauritius, 
    mexico, 
    micronesia, 
    moldova, 
    monaco, 
    mongolia, 
    montenegro, 
    morocco, 
    mozambique, 
    myanmar, 
    namibia, 
    nauru, 
    nepal, 
    netherlands, 
    new zealand, 
    nicaragua, 
    niger, 
    nigeria, 
    north korea, 
    north macedonia, 
    norway, 
    oman, 
    pakistan, 
    palau, 
    palestine state, 
    panama, 
    papua new guinea, 
    paraguay, 
    peru, 
    philippines, 
    poland, 
    portugal, 
    qatar, 
    romania, 
    russia, 
    rwanda, 
    saint kitts and nevis, 
    saint lucia, 
    saint vincent and the grenadines, 
    samoa, 
    san marino,
    sao tome and principe, 
    saudi arabia, 
    senegal, 
    serbia,
    seychelles, 
    sierra leone, 
    singapore, 
    slovakia, 
    slovenia, 
    solomon islands, 
    somalia, 
    south africa, 
    south korea, 
    south sudan, 
    spain, 
    sri lanka, 
    sudan, 
    suriname, 
    sweden, 
    switzerland, 
    syria, 
    tajikistan, 
    tanzania, 
    thailand, 
    timor-leste, 
    togo, 
    tonga, 
    trinidad and tobago, 
    tunisia, 
    turkey, 
    turkmenistan, 
    tuvalu, 
    uganda, 
    ukraine, 
    united arab emirates, 
    united kingdom, 
    united states of america, 
    uruguay, 
    uzbekistan, 
    vanuatu, 
    venezuela, 
    vietnam, 
    yemen, 
    zambia, 
    zimbabwe

    ]).

% list of kinda funny responses for the bot to choose from when the user-given name doesn't match the CS152 students I have listed under "student"
list_of_responses(requestingName, [
    ['You are joking. Is that your name.'],
    ['You are funny. But for real, tell me your name.'],
    ['I am not trying to be rude, but that sounds like a fake name.'],
    ['I am so stubborn. I have to know your name.'],
    ['Come on, do not kill the fun. Just tell me your name.']
    ]).
        
% list of responses the chatbot to select from when it is asked to tell his name. His name is Aben, btw. 
list_of_responses(botName, [
    ['I am Aben. How can I help you?'],
    ['Aben, sir/maam'],
    ['You\'re talking to Aben'],
    ['Aben- ready for service'],
    ['Aben here- what is up?']
    ]).


% And to make the bot feel more like human. I decided to give it nationality. 
% this will give the user a feeling that he/she is speaking to a human and not a typical machine.
list_of_responses(botNationality, [
    ['I\'m Ethiopian!'],
    ['I am from Ethiopia'],
    ['Born and raised in Ethiopia'],
    ['Pround Ethiopian'],
    ['Ethiopian it is'],
    ['I prefer not to talk about it']
    ]).


% below I have included sets of options for the bot to send gratitude for the user afte the user submits the requested information.
% Since, we want this experiance to be more human like, the bot should also send gratitude, not just the human-user
list_of_responses(showingGratitude, [
    ['Thanks a lot, Aben!'],
    ['Bro, that was dope!'],
    ['Thanks mate!'],
    ['Appreciated Brother!'],
    ['You are a good one. Thanks!'],
    ['Bless up my guy!'],
    ['cool cool!']
    ]).


% below, I have included lists of reponses for the bot to pick up and repond to when the user sends gratitude.
% since the way the user sends gratitude is not one fixed word, I have compiled I think people use to send gratitudes in chats(but I know people use so may different expressions beyond these).
% I have stored that inside the list_of_gratitudes
list_of_responses(responseToGratitude, [
    ['Anytime!'],
    ['Anything for you.'],
    ['It is my pleasure.'],
    ['Cheers.'],
    ['No worries at all.']
    ]).

% below is the list_of_gratitudes I have mentioned above.
list_of_gratitudes([
    thanks,
    appreciated,
    thankyou,
    awesome
    ]).


% one of the common thing users do when chatting with bot is asking it how the bot is doing. 
% and I want the bot to give a human-like response. 
% so here, I have included the possible ways the bot can respond to these kinds of personal questions
list_of_responses(responseToPersonalQ, [
    ['All good, thanks for asking.'],
    ['Life is good!'],
    ['It could have been worse. '],
    ['Thank God'],
    ['Assignments are killing me!'],
    ['I am doing great!']
    ]).


%  here, I have included the responses for the bot to choose from to make the conversation active and two-sided. 
% this way the chat will also ask some random questions in the middle of the conversations the way normal human beings do. 
% this way, the user won't be bored with a straight back and forth conversation with a machine.

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


% this enables the bot to say he doesn't know the answer to questions that are not defined in the knowledge base. 
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


%#######################################################################################

% after every service provided, one of the common things to do is to ask for feedback.
% since the chatbot has been givingg a service of responding, I want it to ask for feedback.
% below included the list of values for the chatbot to select from and display for the user to see and provide a rating.
list_of_inquiries(seeking_improvement, [
    ['Tell me I was awesome in the scale of one to ten'],
    ['How was your over all experiance?'],
    ['On the scale of 1 to 10, how would you rate my performance?'],
    ['On the scale of 5 stars, what will you give me?']
    ]).


% just some of the most common questions one Minervan asks to another Minervan
% so I figured the bot should act Minervan and choose from these questions to collect student's info. 
list_of_inquiries(basic_info_of_student, [
    ['What is your name buddy?'],
    ['And you said you are from Minerva?'],
    ['So how long has it been since you started?'],
    ['When is your expected year of graduation?'],
    ['Where are you from originally?']
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

askingBotNationality([which, country, are, you, representing, A |_], A):-!.
askingBotNationality([which country , are, you, from, A |_], A):-!.
askingBotNationality([what, is, your, nationality, A |_], A):-!.
askingBotNationality([where, were, you, born, and, raised, A |_], A):-!.
askingBotNationality([where, was, your, passport, issued, A |_], A):-!.

askingBotNationality([_|T], A):-
    askingBotNationality(T, A).


askingBotName([what, is, your, name, A |_], A):-!.
askingBotName(['what\'s', your, name, A |_], A):-!.
askingBotName([your, name, A |_], A):-!.
askingBotName(['Did\'nt', get, your, name, A |_], A):-!.
askingBotName([i, did, not, get, your, name, A |_], A):-!.
askingBotName([name, please, , A |_], A):-!.
askingBotName([_|T], A):-
    askingBotName(T, A).

% Matches questions about how the chatbot is feeling.
askingPersonal_Q([how, you, doing, A |_], A):-!.
askingPersonal_Q([how, is, life, A |_], A):-!.
askingPersonal_Q([is, everything, okay, A |_], A):-!.
askingPersonal_Q([what, is, up, with, you, A |_], A):-!.
askingPersonal_Q([_|T], A):-
    askingPersonal_Q(T, A).


% ####################################################################

% Checks to see if SubSet is an intersection of Set1 and Set2.
checking_intersection_between_two_subsets([], _, []).
checking_intersection_between_two_subsets([H|T1], L2, [H|T3]):- 
        items_of_interest(H, L2), !,
        checking_intersection_between_two_subsets(T1, L2, T3).
checking_intersection_between_two_subsets([_|T1], L2, L3):-
        checking_intersection_between_two_subsets(T1, L2, L3).


% this avoids brackets and commans when adding input to list
take_inputs_and_add_to_list([]):- nl.
take_inputs_and_add_to_list([H|T]):- write(H), write(' '), take_inputs_and_add_to_list(T).

% the variables I used are self-explanatory.
check_if_subset_exists([], _).
check_if_subset_exists([H|T], L2):- 
        items_of_interest(H, L2),
        check_if_subset_exists(T, L2).

% this can only be true if the item of interest indeed exists in the list(with associated index).
check_for_list_item_with_given_index([H|_], 1, H).
check_for_list_item_with_given_index([_|T], Idx, X):-
        check_for_list_item_with_given_index(T, Idx1, X),
        Idx is Idx1 + 1.

% this will hold true id the given substring exists within a given string. 
% the variable name is also self-explanatory, so it won't be hard to follow.
check_for_substring_in_stringStudent(X, Y) :-
  atom(X),
  atom(Y),
  student(X, XX),
  student(Y, YY),
  check_for_substring_in_stringStudent(XX, YY).
check_for_substring_in_stringStudent(X, Y) :-
  atom(X),
  student(X, XX),
  check_for_substring_in_stringStudent(XX, Y).
check_for_substring_in_stringStudent(X, Y) :-
  go_into_inner_list_if_matrixForm(Y, X),
  Y \= [].

go_into_inner_list_if_matrixForm(S, L) :-
  append(_, L2, L),
  append(S, _, L2).


% this will hold true id the given substring exists within a given string. 
% the variable name is also self-explanatory, so it won't be hard to follow.

check_for_substring_in_stringCountry(A, B) :-
    atom(A),
    atom(B),
    student(A, AA),
    student(B, BB),
    check_for_substring_in_stringCountry(AA, BB).
check_for_substring_in_stringCountry(A, B) :-
    atom(A),
    student(A, AA),
    check_for_substring_in_stringCountry(AA, B).
check_for_substring_in_stringCountry(A, B) :-
    go_into_inner_list_if_matrixForm(B, A),
    B \= [].
  
  go_into_inner_list_if_matrixForm(S, L) :-
    append(_, L2, L),
    append(S, _, L2).