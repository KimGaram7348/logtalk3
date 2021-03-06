%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <http://logtalk.org/>
%  Copyright 1998-2016 Paulo Moura <pmoura@logtalk.org>
%  
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%  
%      http://www.apache.org/licenses/LICENSE-2.0
%  
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1.0,
		author is 'Paulo Moura',
		date is 2010/04/10,
		comment is 'Unit tests for the "constraints/bp" example.'
	]).

	test(constraints_bp_1) :-
		clique::go.

	test(constraints_bp_2) :-
		magic::go.

	test(constraints_bp_3) :-
		puzzle::solve(V),
		V == [9,5,6,7,1,0,8,2].

	test(constraints_bp_4) :-
		steiner::go.

	-test(constraints_bp_5) :-
		queens3::top.

	-test(constraints_bp_6) :-
		srq::q.

	-test(constraints_bp_7) :-
		srq::q_all.

:- end_object.
