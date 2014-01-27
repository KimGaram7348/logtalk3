
________________________________________________________________________

This file is part of Logtalk <http://logtalk.org/>  
Copyright (c) 1998-2014 Paulo Moura <pmoura@logtalk.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Additional licensing terms apply per Section 7 of the GNU General
Public License 3. Consult the `LICENSE.txt` file for details.
________________________________________________________________________


Overview
--------

The `lgtunit.lgt` file contains a simple framework for defining and
running unit tests in Logtalk. The `lgtunit_messages.lgt` file defines
the default message translations. For more information on these entities,
open the `docs/tools.html` file in a web browser.


Compiling and loading unit tests
--------------------------------

To compile and load this framework type:

	| ?- logtalk_load(lgtunit(loader)).

The unit tests framework is inspired on the works of Joachim Schimpf 
(ECLiPSe library `test_util`) and Jan Wielemaker (SWI-Prolog `plunit` 
package).

In order to write your own unit tests, define objects extending the 
`lgtunit` object. These objects must be compiled using the compiler
option `hook(lgtunit)`. For example:

	| ?- logtalk_load(my_tests, [hook(lgtunit)]).


Unit test dialects
------------------

Unit tests can be written using any of the following dialects:

	test(Test) :- Goal.

This is the most simple dialect, allowing the specification of tests
that are expected to succeed. However, tests that are expected to throw
an error cannot be specified. A more versatile dialect is:

	succeeds(Test) :- Goal.
	fails(Test) :- Goal.
	throws(Test, Ball) :- Goal.

This is a straightforward dialect. For `succeeds/1` tests, `Goal` is
expected to succeed. For `fails/1` tests, `Goal` is expected to fail.
For `throws/2` tests, `Goal` is expected to throw the exception term
`Ball`. An alternative test dialect that can be used with the same
expressive power is:

	test(Test, Outcome) :- Goal.

The possible values of the outcome argument are:

- `true`  
	the test is expected to succeed
- `true(Test)`  
	the test is expected to succeed and satisfy the goal `Test`
- `fail`  
	the test is expected to fail
- `error(Error)`  
	the test is expected to throw the exception term `error(Error, _)`
- `ball(Ball)`  
	the test is expected to throw the exception term `Ball`

In all dialects, `Test` is an atom, uniquely identifying a test. A warning is
printed if duplicated identifiers are found.

Tests that for some reason should be skipped can have the test clause head
prefixed with the `(-)/1` operator. An alternative is to use the conditional
compilation directives. The number of skipped tests is reported together with
the numbers of passed and failed tests.

A single unit test object my include tests for one or more entities (objects,
protocols, and categories). The entities being tested by an unit test object
for which code coverage information should be collected are declared using
the `cover/1` predicate.

For examples of how to write unit tests, check the `tests` folder or the
`testing` example in the `examples` folder in the Logtalk distribution.
Most of the provided examples also include unit tests.

Parameterized unit tests can be easily defined by using parametric objects.

Note: when using the `(<<)/2` control construct to access and test an object
internal predicates, make sure that the `context_switching_calls` compiler
flag is set to `allow` for those objects.


Setup and cleanup goals
-----------------------

A unit test object can define `setup/0` and `cleanup/0`. goals. The `setup/0`
predicate is called, when defined, before running the object unit tests. The
`cleanup/0` predciate is called, when defined, after running all the object
unit tests.


Debugging failed unit tests
---------------------------

In order to debug failed unit tests, you can compile the unit test objects
without using the `hook/1` option and use the `(<<)/2` control construct to
call the individual tests. For example, if you have a `test(test_n)` unit
test that is failing, you can type:

	| ?- logtalk_load(my_tests).
	...

	| ?- my_tests << test(test_n).
	...

You may also compile the unit test objects in debug mode and use the Logtalk
debugger. For example:

	| ?- logtalk_load(debugger(loader)).
	...

	| ?- logtalk_load(my_tests, [debug(on)]).
	...

	| ?- debugger::trace.
	...

	| ?- my_tests << test(test_n).
	...


Code coverage
-------------

If you want entity predicate clause coverage information to be collected
and printed, you will need to compile the entities that you're testing
using the options `debug(on)` and `source_data(on)`. Be aware, however,
that compiling in debug mode results in a performance penalty. Your unit
test objects must also define facts for the predicate `cover/1`, whose
argument is the identifier of an entity being tested for which you want
to collect coverage information.

In the printed predicate clause coverage information, you may get a total
number of clauses smaller than the covered clauses. This results from the
use of dynamic predicates with clauses asserted at runtime. You may easily
identify dynamic predicates in the results as their clauses often have a
initial count equal to zero.

The list of indexes of the covered predicate clauses can be long. Some backend
Prolog compilers provide a flag or a predicate to control the depth of printed
terms that can be useful:

* CxProlog: `write_depth/2` predicate
* ECLiPSe: `print_depth` flag
* SICStus Prolog: `toplevel_print_options` flag
* SWI-Prolog: `toplevel_print_options` flag
* XSB: `set_file_write_depth/1` predicate
* YAP: `write_depth/2-3` predicates

All source files are formatted using tabs (the recommended setting is a tab
width equivalent to 4 spaces).