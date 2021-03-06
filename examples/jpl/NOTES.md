________________________________________________________________________

This file is part of Logtalk <http://logtalk.org/>  
Copyright 1998-2016 Paulo Moura <pmoura@logtalk.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
________________________________________________________________________


To load this example and for sample queries, please see the `SCRIPT.txt`
file.

This folder contains a minimal abstraction of the JPL library distributed
with SWI-Prolog and YAP. This abstraction makes use of Logtalk parametric
objects and allows creating Java object, accessing Java class fields, and
calling Java class and object methods using a more Logtalk-like syntax. It
also gives access to some of the JPL utility predicates.

This abstraction is also expected to be implementable with alternative Java
interfaces found in backend Prolog compilers other than SWI-Prolog and YAP.

The main idea is to use parametric objects where the first parameter holds
the Java reference (usually to a class or object) and an optional second
parameter holds the return value. Together with a forward message handler,
this allows the use of Java messages with the same functor and number of
arguments as found in the JavaDocs.

For demonstration, adaptations of the JColorChooser and JOptionPane dialog
examples and the JTable example from the JPL distribution are included.

There are two loader files in this example, The `loader.lgt` file loads
only the JPL library and the Logtalk abstraction of the JPL API. The
`examples.lgt` file loads base files and the examples.

When running the GUI examples on the Mac OS X Terminal application, you may
get a Java error saying that the AWT cannot be started. In alternative, try
to run the example from within the SWI-Prolog Mac OS X application instead
of using the shell integration script. This issue is due to a Mac OS X Java
issue that's orthogonal to both SWI-Prolog/YAP and Logtalk.
