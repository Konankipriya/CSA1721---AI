% Facts representing the database
teaches(teacher1, math, math101).
teaches(teacher2, physics, phy101).
teaches(teacher3, computer_science, cs101).

enrolled(student1, math, math101).
enrolled(student1, physics, phy101).
enrolled(student2, computer_science, cs101).
enrolled(student3, math, math101).
enrolled(student3, physics, phy101).
enrolled(student3, computer_science, cs101).

% Queries
teaches_subject(Teacher, Subject) :-
    teaches(Teacher, Subject, _).

enrolled_student(Student, Subject) :-
    enrolled(Student, Subject, _).

subject_code(Subject, Code) :-
    teaches(_, Subject, Code).

% Example usage:
% teaches_subject(Teacher, Subject).
% enrolled_student(Student, Subject).
% subject_code(Subject, Code).
