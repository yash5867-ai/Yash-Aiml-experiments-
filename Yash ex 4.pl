% Timetable facts
lecture(monday, 9, mathematics).
lecture(monday, 10, physics).
lecture(tuesday, 9, computer_science).
lecture(tuesday, 11, english).
lecture(wednesday, 10, chemistry).
lecture(thursday, 9, mathematics).
lecture(friday, 11, computer_science).

% Rules
subject_on_day(Day, Subject) :-
    lecture(Day, _, Subject).

time_of_subject(Subject, Day, Time) :-
    lecture(Day, Time, Subject).

morning_class(Day, Subject) :-
    lecture(Day, Time, Subject),
    Time < 12.
