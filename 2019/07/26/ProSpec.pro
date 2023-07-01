% ProSpec is a BDD spec framework for Prolog.
%
% Copyright (c) 2009, Stefan Roock, stefan@stefanroock.de, http://www.stefanroock.de
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without modification,
% are permitted provided that the following conditions are met:
%
%    * Redistributions of source code must retain the above copyright notice,
%      this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in the
%      documentation and/or other materials provided with the distribution.
%    * Neither the name of the <ORGANIZATION> nor the names of its
%      contributors may be used to endorse or promote products derived from
%      this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
% THE POSSIBILITY OF SUCH DAMAGE.
%
% This work is based on the unittest framework written bei Ken Egozi:
%   http://www.kenegozi.com/blog/2008/07/24/unit-testing-in-prolog.aspx

it(Spec_Desc/Spec):-
    current_fixture(Fixture),
    retractall(spec_def(Fixture/Spec_Desc/Spec)),
    assert(spec_def(Fixture/Spec_Desc/Spec)). 
 
describe(Fixture) :-
    retractall(spec_def(Fixture/_/_)),
    assert(current_fixture(Fixture)). 
 
end_describe:-
    retractall(current_fixture(_)). 
 
run_one_spec(Pred/Name) :-
	spec_def(Pred/Name/Spec),
	setup_spec,
	call(Spec).

run_specs :-
    dynamic(setup_spec/0),
    dynamic(specs_stats/2),
    write('Run Specs '), nl,
    bagof(Fixture/Specs, bagof((Spec_Desc/Spec), spec_def(Fixture/Spec_Desc/Spec), Specs), SpecsPerPredicate),
    run_specs(SpecsPerPredicate, Passed/Failed),
    write_specs_summary(Passed/Failed). 
 
run_specs(SpecsSpecsPerPredicate, TotalPassed/TotalFailed) :-
    run_specs(SpecsSpecsPerPredicate, 0/0, TotalPassed/TotalFailed). 
 
run_specs([], Passed/Failed, Passed/Failed):-!. 

run_specs([Fixture/Specs|Rest], Passed/Failed, TotalPassed/TotalFailed):-
    nl, write(Fixture), write('...'), nl,
    foreach_spec(Specs, PassedInPredicate/FailedInPredicate),
    write('Passed:'), write(PassedInPredicate),
    (FailedInPredicate > 0, write(' Failed:'), write(FailedInPredicate) ; true),
    nl,
    Passed1 is Passed + PassedInPredicate,
    Failed1 is Failed + FailedInPredicate,
    run_specs(Rest, Passed1/Failed1, TotalPassed/TotalFailed). 
 
foreach_spec(Specs, Passed/Failed):-
    foreach_spec(Specs, 0/0, Passed/Failed). 
 
foreach_spec([], Passed/Failed, Passed/Failed):-!. 
foreach_spec([Spec_Desc/Spec|Rest], Passed/Failed, NewPassed/NewFailed):-
	write('...'), write(Spec_Desc),     
	(
		setup_spec, call(Spec), !,
	        NextPassed is Passed + 1,
	        NextFailed is Failed,
	        write(' (passed)'), nl
	;
        	NextFailed is Failed + 1,
        	NextPassed is Passed,
        	write(' (FAILED)'), nl
	),
    	foreach_spec(Rest, NextPassed/NextFailed, NewPassed/NewFailed). 
 
write_specs_summary(Passed/0) :- !,
    nl,
    write(Passed), write(' specs passed'),
    nl. 
write_specs_summary(Passed/Failed) :-
    nl,
    write(Passed), write(' specs passed,'), nl,
    write(Failed), write(' specs failed'),
    nl. 
 
reset_all_specs:-
    retractall(spec_def(_/_/_)).

run_spec(Spec) :-
    call(Spec),!,
    specs_passed(X),
    retract(specs_passed(X)),
    NewX is X + 1,
    assert(specs_passed(NewX)).
run_spec(Spec) :-
    failing_specs(X),
    retract(failing_specs(X)),
    NewX = [Spec|X],
    assert(failing_specs(NewX)).

% Asserts
assert_that(Actual, equals:Expected) :-
	Actual \= Expected, !, nl, write('\tExpected '), write(Expected), write(' equal to '), write(Actual), nl, fail;
	Actual == Expected.

assert_that(Actual, not_equals:Expected) :-
	Actual == Expected, nl, write('\tExpected '), write(Expected), write(' not equal to '), write(Actual), nl, fail;
	Actual \= Expected.
	
assert_that(Actual, is_true) :-
	Actual;
	nl, write('Expected '), write(Actual), write(' to be true '), nl, fail.
	
assert_that(Actual, is_false) :-
	Actual, !, nl, write('\tExpected '), write(Actual), write(' to be false '), nl, fail;
	true.
	
assert_that(Actual, fails) :- 
	assert_that(Actual, is_false).
	
assert_that(Actual, is_empty) :-
	Actual \= [], nl, write('\tExpected '), write(Actual), write(' to be empty '), nl, fail;
	Actual == [].

assert_that(Actual, has_member:Member) :-
	not(member(Member, Actual)), nl, write('\tExpected '), write(Actual), write(' to has member '), write(Member), nl, fail;
	member(Member, Actual).

assert_that(Actual, has_no_member:Member) :-
	member(Member, Actual), nl, write('\tExpected '), write(Actual), write(' to has no member '), write(Member), nl, fail;
	not(member(Member, Actual)).

assert_that(Actual, contains_all:Sublist) :-
	not(contains_all(Actual, Sublist)), nl, write('\tExpected '), write(Actual), write(' to contain all members of '), write(Sublist), nl, fail;
	contains_all(Actual, Sublist).

contains_all(_, []) :- true.
contains_all(List, [Member]) :- member(Member, List).
contains_all(List, [Member|Rest]) :- member(Member, List), contains_all(List, Rest).

