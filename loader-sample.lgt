%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Sample loader file
%  Last updated on November 14, 2014
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


%  This is a sample loader file. Loader files are simply Logtalk source
%  files whose main purpose is to load your application files.
%
%  During development, loader files can be reloaded repeatedly. Therefore,
%  any generic settings shared by all source files, such as library paths,
%  global flag values, and initialization goals with side-effects, are
%  best defined in a settings file saved in the application directory and
%  by starting Logtalk from that directory.
%
%  Note that the logtalk_load/1-2 predicates can compile and load both
%  Logtalk and Prolog files


%  Load your application files:

:- initialization((
	logtalk_load([
		source_file_1,
		source_file_2,
		...
	])
)).
