/*
 * Copyright (C) The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "TimedRestore.h"
#include <fstream>

TimedRestore::TimedRestore(const std::string& filename)
: filename(filename) {
	std::ifstream ifs(filename);
	if (ifs.fail()) return;
	ifs >> saved_value;
}

TimedRestore::~TimedRestore(void) {
	std::ofstream ofs(filename);
	if (ofs.fail()) return;
	ofs << saved_value;
}

void TimedRestore::set(const int content)
{
	std::ofstream ofs(filename);
	if (saved_value > content) return;
	if (ofs.fail()) return;
	ofs << content;
}
